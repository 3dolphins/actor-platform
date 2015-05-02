//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/mailbox/ActorDispatcher.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/mailbox/ActorDispatcher.java"

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorContext.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorScope.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/ActorTime.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/actors/TraceInterface.h"
#include "im/actor/model/droidkit/actors/dispatch/AbstractDispatcher.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorDispatcher.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorEndpoint.h"
#include "im/actor/model/droidkit/actors/mailbox/Envelope.h"
#include "im/actor/model/droidkit/actors/mailbox/Mailbox.h"
#include "im/actor/model/droidkit/actors/mailbox/MailboxesQueue.h"
#include "im/actor/model/droidkit/actors/messages/DeadLetter.h"
#include "im/actor/model/droidkit/actors/messages/PoisonPill.h"
#include "im/actor/model/droidkit/actors/messages/StartActor.h"
#include "java/lang/Exception.h"
#include "java/lang/Runnable.h"
#include "java/lang/RuntimeException.h"
#include "java/util/HashMap.h"

@interface DKActorDispatcher () {
 @public
  id LOCK_;
  JavaUtilHashMap *endpoints_;
  JavaUtilHashMap *scopes_;
  DKActorSystem *actorSystem_;
  NSString *name_;
  DKAbstractDispatcher *dispatcher_;
}

@end

J2OBJC_FIELD_SETTER(DKActorDispatcher, LOCK_, id)
J2OBJC_FIELD_SETTER(DKActorDispatcher, endpoints_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(DKActorDispatcher, scopes_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(DKActorDispatcher, actorSystem_, DKActorSystem *)
J2OBJC_FIELD_SETTER(DKActorDispatcher, name_, NSString *)
J2OBJC_FIELD_SETTER(DKActorDispatcher, dispatcher_, DKAbstractDispatcher *)


#line 22
@implementation DKActorDispatcher


#line 32
- (instancetype)initWithNSString:(NSString *)name
               withDKActorSystem:(DKActorSystem *)actorSystem {
  DKActorDispatcher_initWithNSString_withDKActorSystem_(self, name, actorSystem);
  return self;
}


#line 42
- (void)initDispatcherWithDKAbstractDispatcher:(DKAbstractDispatcher *)dispatcher {
  if (self->dispatcher_ != nil) {
    @throw new_JavaLangRuntimeException_initWithNSString_(@"Double dispatcher init");
  }
  self->dispatcher_ = dispatcher;
}

- (DKActorRef *)referenceActorWithNSString:(NSString *)path
                               withDKProps:(DKProps *)props {
  @synchronized(LOCK_) {
    if ([((JavaUtilHashMap *) nil_chk(scopes_)) containsKeyWithId:path]) {
      return [((DKActorScope *) nil_chk([scopes_ getWithId:path])) getActorRef];
    }
    
#line 55
    DKMailbox *mailbox = [((DKProps *) nil_chk(props)) createMailboxWithDKMailboxesQueue:[((DKAbstractDispatcher *) nil_chk(dispatcher_)) getQueue]];
    
#line 57
    DKActorEndpoint *endpoint = [((JavaUtilHashMap *) nil_chk(endpoints_)) getWithId:path];
    if (endpoint == nil) {
      endpoint = new_DKActorEndpoint_initWithNSString_(path);
      (void) [endpoints_ putWithId:path withId:endpoint];
    }
    
#line 63
    DKActorScope *scope = new_DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(actorSystem_, mailbox, self, path, props, endpoint);
    [((DKActorEndpoint *) nil_chk(endpoint)) connectWithDKMailbox:mailbox withDKActorScope:scope];
    (void) [scopes_ putWithId:[scope getPath] withId:scope];
    
#line 68
    [((DKActorRef *) nil_chk([scope getActorRef])) sendWithId:ImActorModelDroidkitActorsMessagesStartActor_get_INSTANCE_()];
    return [scope getActorRef];
  }
}


#line 73
- (void)killGracefullyWithDKActorScope:(DKActorScope *)scope {
  [((DKActor *) nil_chk([((DKActorScope *) nil_chk(scope)) getActor])) postStop];
  [scope onActorDie];
  {
    IOSObjectArray *a__ = [((DKMailbox *) nil_chk([scope getMailbox])) allEnvelopes];
    DKEnvelope * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    DKEnvelope * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      DKEnvelope *e = *b__++;
      
#line 78
      if ([((DKEnvelope *) nil_chk(e)) getSender] != nil) {
        [((DKActorRef *) nil_chk([e getSender])) sendWithId:new_ImActorModelDroidkitActorsMessagesDeadLetter_initWithId_([e getMessage])];
      }
    }
  }
  
#line 82
  [((DKMailbox *) nil_chk([scope getMailbox])) clear];
  @synchronized(LOCK_) {
    (void) [((JavaUtilHashMap *) nil_chk(scopes_)) removeWithId:[scope getPath]];
    (void) [((JavaUtilHashMap *) nil_chk(endpoints_)) removeWithId:[scope getPath]];
    [((DKMailboxesQueue *) nil_chk([((DKAbstractDispatcher *) nil_chk(dispatcher_)) getQueue])) disconnectMailboxWithDKMailbox:[scope getMailbox]];
  }
}


#line 90
- (void)sendMessageWithDKActorEndpoint:(DKActorEndpoint *)endpoint
                                withId:(id)message
                              withLong:(jlong)time
                        withDKActorRef:(DKActorRef *)sender {
  if ([((DKActorEndpoint *) nil_chk(endpoint)) isDisconnected]) {
    if (sender != nil) {
      if ([((DKActorSystem *) nil_chk(actorSystem_)) getTraceInterface] != nil) {
        [((id<DKTraceInterface>) nil_chk([actorSystem_ getTraceInterface])) onDeadLetterWithDKActorRef:sender withId:message];
      }
      [sender sendWithId:new_ImActorModelDroidkitActorsMessagesDeadLetter_initWithId_(message)];
    }
  }
  else {
    
#line 99
    [((DKMailbox *) nil_chk([endpoint getMailbox])) scheduleWithDKEnvelope:new_DKEnvelope_initWithId_withDKActorScope_withDKMailbox_withDKActorRef_(message, [endpoint getScope], [endpoint getMailbox], sender) withLong:time];
  }
}


#line 103
- (void)sendMessageOnceWithDKActorEndpoint:(DKActorEndpoint *)endpoint
                                    withId:(id)message
                                  withLong:(jlong)time
                            withDKActorRef:(DKActorRef *)sender {
  if ([((DKActorEndpoint *) nil_chk(endpoint)) isDisconnected]) {
    if (sender != nil) {
      if ([((DKActorSystem *) nil_chk(actorSystem_)) getTraceInterface] != nil) {
        [((id<DKTraceInterface>) nil_chk([actorSystem_ getTraceInterface])) onDeadLetterWithDKActorRef:sender withId:message];
      }
      [sender sendWithId:new_ImActorModelDroidkitActorsMessagesDeadLetter_initWithId_(message)];
    }
  }
  else {
    
#line 112
    [((DKMailbox *) nil_chk([endpoint getMailbox])) scheduleOnceWithDKEnvelope:new_DKEnvelope_initWithId_withDKActorScope_withDKMailbox_withDKActorRef_(message, [endpoint getScope], [endpoint getMailbox], sender) withLong:time];
  }
}


#line 116
- (void)cancelSendWithDKActorEndpoint:(DKActorEndpoint *)endpoint
                               withId:(id)message
                       withDKActorRef:(DKActorRef *)sender {
  if (![((DKActorEndpoint *) nil_chk(endpoint)) isDisconnected]) {
    [((DKMailbox *) nil_chk([endpoint getMailbox])) unscheduleWithDKEnvelope:new_DKEnvelope_initWithId_withDKActorScope_withDKMailbox_withDKActorRef_(message, [endpoint getScope], [endpoint getMailbox], sender)];
  }
}


#line 123
- (NSString *)getName {
  return name_;
}


#line 132
- (void)processEnvelopeWithDKEnvelope:(DKEnvelope *)envelope {
  
#line 134
  DKActorScope *scope = [((DKEnvelope *) nil_chk(envelope)) getScope];
  
#line 138
  if ([((DKActorSystem *) nil_chk(actorSystem_)) getTraceInterface] != nil) {
    [((id<DKTraceInterface>) nil_chk([actorSystem_ getTraceInterface])) onEnvelopeDeliveredWithDKEnvelope:envelope];
  }
  
#line 142
  jlong start = DKActorTime_currentTime();
  jboolean isDisconnected = NO;
  
#line 145
  if ([((DKActorScope *) nil_chk(scope)) getActor] == nil) {
    if ([envelope getMessage] == ImActorModelDroidkitActorsMessagesPoisonPill_get_INSTANCE_()) {
      
#line 148
      return;
    }
    @try {
      DKActor *actor = [((DKProps *) nil_chk([scope getProps])) create];
      [((DKActor *) nil_chk(actor)) initActorWithNSString:[scope getPath] withDKActorContext:new_DKActorContext_initWithDKActorScope_(scope) withDKMailbox:[scope getMailbox]];
      [actor preStart];
      [scope onActorCreatedWithDKActor:actor];
    }
    @catch (
#line 155
    JavaLangException *e) {
      [((JavaLangException *) nil_chk(e)) printStackTrace];
      if ([envelope getSender] != nil) {
        [((DKActorRef *) nil_chk([envelope getSender])) sendWithId:new_ImActorModelDroidkitActorsMessagesDeadLetter_initWithId_(@"Unable to create actor")];
      }
      return;
    }
  }
  
#line 164
  @try {
    if ([envelope getMessage] == ImActorModelDroidkitActorsMessagesStartActor_get_INSTANCE_()) {
      
#line 167
      return;
    }
    else
#line 168
    if ([envelope getMessage] == ImActorModelDroidkitActorsMessagesPoisonPill_get_INSTANCE_()) {
      isDisconnected = YES;
      [((DKActor *) nil_chk([scope getActor])) postStop];
      [scope onActorDie];
      {
        IOSObjectArray *a__ =
#line 172
        [((DKMailbox *) nil_chk([scope getMailbox])) allEnvelopes];
        DKEnvelope * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
        DKEnvelope * const *e__ = b__ + a__->size_;
        while (b__ < e__) {
          DKEnvelope *e = *b__++;
          
#line 173
          if ([((DKEnvelope *) nil_chk(e)) getSender] != nil) {
            [((DKActorRef *) nil_chk([e getSender])) sendWithId:new_ImActorModelDroidkitActorsMessagesDeadLetter_initWithId_([e getMessage])];
          }
        }
      }
      
#line 177
      [((DKMailbox *) nil_chk([scope getMailbox])) clear];
      @synchronized(LOCK_) {
        (void) [((JavaUtilHashMap *) nil_chk(scopes_)) removeWithId:[scope getPath]];
        (void) [((JavaUtilHashMap *) nil_chk(endpoints_)) removeWithId:[scope getPath]];
        [((DKMailboxesQueue *) nil_chk([((DKAbstractDispatcher *) nil_chk(dispatcher_)) getQueue])) disconnectMailboxWithDKMailbox:[scope getMailbox]];
      }
    }
    else {
      
#line 184
      [scope setSenderWithDKActorRef:[envelope getSender]];
      if ([JavaLangRunnable_class_() isInstance:[envelope getMessage]]) {
        [((id<JavaLangRunnable>) nil_chk(((id<JavaLangRunnable>) check_protocol_cast([envelope getMessage], @protocol(JavaLangRunnable))))) run];
        return;
      }
      [((DKActor *) nil_chk([scope getActor])) onReceiveWithId:[envelope getMessage]];
    }
  }
  @catch (
#line 191
  JavaLangException *e) {
    if ([actorSystem_ getTraceInterface] != nil) {
      [((id<DKTraceInterface>) nil_chk([actorSystem_ getTraceInterface])) onActorDieWithDKActorRef:[scope getActorRef] withJavaLangException:e];
    }
    [scope onActorDie];
    isDisconnected = YES;
    @synchronized(LOCK_) {
      (void) [((JavaUtilHashMap *) nil_chk(scopes_)) removeWithId:[scope getPath]];
      (void) [((JavaUtilHashMap *) nil_chk(endpoints_)) removeWithId:[scope getPath]];
      [((DKMailboxesQueue *) nil_chk([((DKAbstractDispatcher *) nil_chk(dispatcher_)) getQueue])) disconnectMailboxWithDKMailbox:[scope getMailbox]];
    }
  }
  @finally {
    
#line 203
    if ([actorSystem_ getTraceInterface] != nil) {
      [((id<DKTraceInterface>) nil_chk([actorSystem_ getTraceInterface])) onEnvelopeProcessedWithDKEnvelope:envelope withLong:DKActorTime_currentTime() - start];
    }
    if (!isDisconnected) {
      [((DKMailboxesQueue *) nil_chk([((DKAbstractDispatcher *) nil_chk(dispatcher_)) getQueue])) unlockMailboxWithDKMailbox:[envelope getMailbox]];
    }
  }
}

@end


#line 32
void DKActorDispatcher_initWithNSString_withDKActorSystem_(DKActorDispatcher *self, NSString *name, DKActorSystem *actorSystem) {
  (void) NSObject_init(self);
  self->LOCK_ = new_NSObject_init();
  self->endpoints_ = new_JavaUtilHashMap_init();
  self->scopes_ = new_JavaUtilHashMap_init();
  
#line 33
  self->name_ = name;
  self->actorSystem_ = actorSystem;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKActorDispatcher)
