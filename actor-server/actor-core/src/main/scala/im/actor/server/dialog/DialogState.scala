package im.actor.server.dialog

import java.time.Instant

import akka.event.{ Logging, LoggingAdapter }
import akka.persistence.SnapshotMetadata
import im.actor.server.cqrs.{ Event, ProcessorState, TaggedEvent }
import im.actor.server.model.Peer
import org.slf4j.LoggerFactory

import scala.collection.SortedSet

private[dialog] trait DialogEvent extends TaggedEvent {
  override def tags: Set[String] = Set("dialog")
}

trait DialogQuery {
  val dest: Option[Peer]

  def getDest: Peer
}

private[dialog] object DialogState {
  def initial(userId: Int) = DialogState(
    userId = userId,
    lastMessageDate = Instant.ofEpochMilli(0),
    lastOwnerReceiveDate = Instant.ofEpochMilli(0),
    lastReceiveDate = Instant.ofEpochMilli(0),
    lastOwnerReadDate = Instant.ofEpochMilli(0),
    lastReadDate = Instant.ofEpochMilli(0),
    counter = 0,
    unreadMessages = SortedSet.empty
  )
}

private[dialog] final case class DialogState(
  userId:               Int,
  lastMessageDate:      Instant,
  lastOwnerReceiveDate: Instant,
  lastReceiveDate:      Instant,
  lastOwnerReadDate:    Instant,
  lastReadDate:         Instant,
  counter:              Int,
  unreadMessages:       SortedSet[Long] // unread dates. duplicate dates will not count! maybe we should use list and sort it manually?
) extends ProcessorState[DialogState] {
  import DialogEvents._

  val log = LoggerFactory.getLogger(s"$userId/DialogRoot")

  override def updated(e: Event): DialogState = e match {
    case NewMessage(randomId, date, senderUserId, messageHeader) ⇒
      if (senderUserId != userId) {
        this.copy(
          counter = counter + 1,
          unreadMessages = unreadMessages + date.toEpochMilli,
          lastMessageDate = date
        )
      } else this.copy(lastMessageDate = date)
    case MessagesRead(date, readerUserId) if readerUserId == userId ⇒
      val dateMillis = date.toEpochMilli
      log.debug(s"unreadMessages (fromState) ${unreadMessages}")
      val readMessages = unreadMessages.takeWhile(messDate ⇒ messDate <= dateMillis)
      log.debug(s"readMessages ${readMessages}")
      //      log.debug(s"readMessages date ${unreadMessages.headOption map (um ⇒ um.date.isBefore(date) || um.date == date)}")
      val newUnreadMessages = unreadMessages.drop(readMessages.size)

      this.copy(
        counter = newUnreadMessages.size,
        unreadMessages = newUnreadMessages,
        lastOwnerReadDate = date
      )
    case MessagesRead(date, readerUserId) if readerUserId != userId ⇒
      if (date.isBefore(Instant.now().plusMillis(1)) && (date.isAfter(lastReadDate) || date == lastReadDate)) // what's a point of creating state with same lastReadDate(last condition)
        this.copy(lastReadDate = date)
      else this
    case MessagesReceived(date, receiverUserId) if receiverUserId == userId ⇒
      this.copy(lastOwnerReceiveDate = date)
    case MessagesReceived(date, receiverUserId) if receiverUserId != userId ⇒
      if (date.isBefore(Instant.now().plusMillis(1)) && (date.isAfter(lastReceiveDate) || date == lastReceiveDate)) // what's a point of creating state with same lastReadDate(last condition)
        this.copy(lastReceiveDate = date)
      else this
    case SetCounter(newCounter) ⇒
      this.copy(counter = newCounter)
    case Initialized() ⇒ this
  }

  override def withSnapshot(metadata: SnapshotMetadata, snapshot: Any): DialogState = snapshot match {
    case s: DialogStateSnapshot ⇒
      copy(
        userId = s.userId,
        lastMessageDate = s.lastMessageDate,
        lastOwnerReceiveDate = s.lastOwnerReceiveDate,
        lastReceiveDate = s.lastReceiveDate,
        lastOwnerReadDate = s.lastOwnerReadDate,
        lastReadDate = s.lastReadDate,
        counter = s.counter,
        unreadMessages = SortedSet(s.unreadMessages: _*)
      )
  }

  override lazy val snapshot = DialogStateSnapshot(
    userId = userId,
    lastMessageDate = lastMessageDate,
    lastOwnerReceiveDate = lastOwnerReceiveDate,
    lastReceiveDate = lastReceiveDate,
    lastOwnerReadDate = lastOwnerReadDate,
    lastReadDate = lastReadDate,
    counter = counter,
    unreadMessages = unreadMessages.toSeq
  )

  // we can remove this step completely, if we use Vector[Int] for unreadMessages
  private[dialog] def nextDate: Long = {
    val now = Instant.now.toEpochMilli
    if (unreadMessages.lastOption.contains(now)) now + 1L
    else now
  }
}
