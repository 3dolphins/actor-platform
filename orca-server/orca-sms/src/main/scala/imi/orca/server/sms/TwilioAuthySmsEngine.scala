package imi.orca.server.sms

import cats.data.Xor
import imi.orca.server.sms.common.AuthSmsEngine
import imi.orca.server.sms.model.{ AuthyFailed, AuthyPhone, AuthySuccess }

import scala.concurrent.Future

/**
 * Created by sonny on 7/14/16.
 */
final class TwilioAuthySmsEngine(twilioAuthyClient: TwilioAuthyClient) extends AuthSmsEngine {
  override def sendCode(phoneNumber: Long): Future[AuthyPhone Xor AuthyFailed] = twilioAuthyClient.sendSmsCode(phoneNumber)
  override def validateCode(phoneNumber: Long, countryCode: Int, verificationCode: String): Future[AuthySuccess Xor AuthyFailed] = twilioAuthyClient.validateSmsCode(phoneNumber, countryCode, verificationCode)
}
