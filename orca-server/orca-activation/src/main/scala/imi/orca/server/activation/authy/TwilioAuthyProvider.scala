package imi.orca.server.activation.authy

import akka.actor.ActorSystem
import akka.http.scaladsl.util.FastFuture
import cats.data.Xor
import im.actor.config.ActorConfig
import im.actor.server.activation.common.{CodeFailure, _}
import im.actor.server.db.DbExtension
import imi.orca.server.persist.auth.TwilioAuthyCodeRepo
import imi.orca.server.sms.model.{AuthyFailed, AuthyPhone}
import imi.orca.server.sms.{TwilioAuthyClient, TwilioAuthySmsEngine}

import scala.concurrent.Future


final class TwilioAuthyProvider(implicit system: ActorSystem) extends ActivationProvider  {
  protected val db = DbExtension(system).db
  protected implicit val ec = system.dispatcher

  private val authyClient = new TwilioAuthyClient(ActorConfig.load().getConfig("sms.authy"))
  private val smsEngine = new TwilioAuthySmsEngine(authyClient)

  override def send(txHash: String, code: Code): Future[CodeFailure Xor Unit] = {
    require(code.isInstanceOf[SmsCode], "TwilioAuthyProvider is only capable of processing sms codes")
    val smsCode = code.asInstanceOf[SmsCode]

    val resp = smsEngine.sendCode(smsCode.phone) map {
      value => if (value.isLeft) AuthyPhone(smsCode.phone) else AuthyFailed("") } recover {
      case _ => AuthyFailed("") }

    for {
      authResponse <- resp
      result <- authResponse match {
        case authyPhone: AuthyPhone =>
          for {
            result <- db.run(TwilioAuthyCodeRepo.createOrUpdate(txHash, authResponse.asInstanceOf[AuthyPhone].phoneNumber, authResponse.asInstanceOf[AuthyPhone].countryCode))
          } yield Xor.right(())
        case authyFailure : AuthyFailed =>
          FastFuture.successful(Xor.left(new SendFailure("Please verify your phone number  ex. +XX XXXXXXXXXX")))
      }
    } yield result
  }

  override def validate(txHash: String, code: String): Future[ValidationResponse] = {
    for {
      optTxHash ← db.run(TwilioAuthyCodeRepo.find(txHash))
      validatedResponse <- optTxHash map { trxHash =>
        smsEngine.validateCode(trxHash.phoneNumber, trxHash.countryCode, code) map {
          value => if (value.isLeft) Validated else InvalidCode
        } recover { case _ => InvalidCode }
      } getOrElse {
        FastFuture.successful(InvalidCode)
      }
    } yield validatedResponse
  }

  override def cleanup(txHash: String): Future[Unit] = db.run(TwilioAuthyCodeRepo.delete(txHash)).map(_ ⇒ ())
}
