package imi.orca.server.model.auth

case class TwilioAuthyCode(transactionHash: String, phoneNumber: Long, countryCode: Int, isDeleted: Boolean = false)
