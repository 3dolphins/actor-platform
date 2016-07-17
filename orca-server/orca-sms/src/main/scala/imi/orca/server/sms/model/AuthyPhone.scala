package imi.orca.server.sms.model

import im.actor.util.misc.PhoneNumberUtils


/**
  * Authy phone object model
  *
  * Created by sonny on 7/14/16.
  */

object AuthyPhone {
}

final case class AuthyPhone(Phone: Long) {
  var countryCode : Int = 0
  var phoneNumber : Long = 0
  parse()

  private def parse() : Unit = {
    val phoneInfo = scala.collection.JavaConversions.seqAsJavaList(PhoneNumberUtils.parse(Phone.toString))

    if (!phoneInfo.isEmpty) {
      val phoneMetadata = phoneInfo.get(0)
      countryCode = phoneMetadata.getCountryCode
      phoneNumber = phoneMetadata.getNationalNumber
    }
  }

}

