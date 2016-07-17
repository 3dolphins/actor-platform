package imi.orca.server.persist.auth

import im.actor.server.db.ActorPostgresDriver.api._
import imi.orca.server.model.auth.TwilioAuthyCode

final class TwilioAuthyCodeTable(tag: Tag) extends Table[TwilioAuthyCode](tag, "twilio_authy_codes") {
  def transactionHash = column[String]("transaction_hash", O.PrimaryKey)
  def phoneNumber = column[Long] ("phone_number")
  def countryCode = column[Int] ("country_code")
  def isDeleted = column[Boolean]("is_deleted")

  def * = (transactionHash, phoneNumber, countryCode, isDeleted) <> (TwilioAuthyCode.tupled, TwilioAuthyCode.unapply)
}

object TwilioAuthyCodeRepo {
  def codes = TableQuery[TwilioAuthyCodeTable]

  val active = codes.filter(_.isDeleted === false)

  def createOrUpdate(transactionHash: String, phoneNumber: Long, countryCode: Int) =
    codes.insertOrUpdate(TwilioAuthyCode(transactionHash, phoneNumber, countryCode))

  def find(transactionHash: String) =
    active.filter(_.transactionHash === transactionHash).result.headOption

  def delete(transactionHash: String) =
    codes.filter(_.transactionHash === transactionHash).map(_.isDeleted).update(true)

}
