package imi.orca.server.sms.common

import cats.data.Xor
import imi.orca.server.sms.model.{ AuthyFailed, AuthyPhone, AuthySuccess }

import scala.concurrent.Future

trait AuthSmsEngine {
  def sendCode(phoneNumber: Long): Future[AuthyPhone Xor AuthyFailed]
  def validateCode(phoneNumber: Long, countryCode: Int, verificationCode: String): Future[AuthySuccess Xor AuthyFailed]
}