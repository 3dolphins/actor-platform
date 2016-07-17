package imi.orca.server.sms

import java.net.URLEncoder

import akka.actor.ActorSystem
import akka.http.scaladsl.util.FastFuture
import cats.data.Xor
import com.ning.http.client.Response
import com.typesafe.config.Config
import dispatch.{Http, Req, url}
import imi.orca.server.sms.model.{AuthyFailed, AuthyPhone, AuthySuccess}

import scala.concurrent.{ExecutionContext, Future}
import scala.util.{Failure, Success}

/**
  * Created by sonny on 7/14/16.
  */
object TwilioAuthyClient {
  private val BaseUrl = "https://api.authy.com"
  private val ApiEndpoint = "protected/json/phones/verification"
  private val ApiSend = "/start"
  private val ApiValidate = "/check"
}

final class TwilioAuthyClient(config: Config)(implicit system : ActorSystem) {

  import TwilioAuthyClient._

  private val apiKey = config
  private val Utf8Encoding = "UTF-8"
  private val FormContentType = "application/x-www-form-urlencoded"

  system registerOnTermination http.shutdown()

  private lazy val http = new Http()

  private implicit val ec: ExecutionContext = system.dispatcher

  def sendSmsCode(phoneNumber: Long): Future[AuthyPhone Xor AuthyFailed] = {
    val authyPhone: AuthyPhone = AuthyPhone(phoneNumber)
    for {
      resp <- sendRequest("", Map(
        "api_key" -> config.getString("api-key"),
        "phone_number" -> authyPhone.phoneNumber.toString,
        "country_code" -> authyPhone.countryCode.toString,
        "via" -> "sms"
      ))
      result <- if (resp.getStatusCode != 200) {
        FastFuture.successful(Xor.right(AuthyFailed("")))
      } else {
        FastFuture.successful(Xor.left(authyPhone))
      }
    } yield result
  }

  def validateSmsCode(phoneNumber: Long, countryCode: Int, code: String): Future[AuthySuccess Xor AuthyFailed] = {
    for {
      resp <- validateRequest("", Map(
        "api_key" -> config.getString("api-key"),
        "phone_number" -> phoneNumber.toString,
        "country_code" -> countryCode.toString,
        "verification_code" -> code.toString
      ))
      result <- if (resp.getStatusCode == 200) {
        FastFuture.successful(Xor.left(AuthySuccess("")))
      } else {
        FastFuture.successful(Xor.right(AuthyFailed("")))
      }
    } yield result
  }

  private def sendUri(resourcePath: String): String = s"/$ApiEndpoint$ApiSend$resourcePath"
  private def sendUrl(resourcePath: String): Req = url(s"$BaseUrl${sendUri(resourcePath)}")

  private def validateUri(resourcePath: String): String = s"/$ApiEndpoint$ApiValidate$resourcePath"
  private def validateUrl(resourcePath: String): Req = url(s"$BaseUrl${validateUri(resourcePath)}")


  private def sendRequest(resourcePath: String, params: Map[String, String]): Future[Response] = {
    val body = params.map(p ⇒ s"${p._1}=${URLEncoder.encode(p._2, Utf8Encoding)}").mkString("&")
    val resUrl = sendUrl(resourcePath)
    val request = (resUrl.POST.setContentType(FormContentType, Utf8Encoding).setBody(body))

    http(request).map { resp ⇒
      resp
    } andThen {
      case Failure(e) ⇒
        system.log.error(e, "Failed to make request to authy")
      case Success(resp) =>
        system.log.debug("Success to make request to authy")
    }
  }

  private def validateRequest(resourcePath: String, params: Map[String, String]): Future[Response] = {
    val body = params.map(p ⇒ s"${p._1}=${URLEncoder.encode(p._2, Utf8Encoding)}").mkString("&")
    val resUrl = validateUrl(s"""$resourcePath?$body""")
    val request = (resUrl.GET)

    http(request).map { resp ⇒
      resp
    } andThen {
      case Failure(e) ⇒
        system.log.error(e, "Failed to make request to authy")
      case Success(resp) =>
        system.log.debug("Success to make request to authy")
    }
  }
}
