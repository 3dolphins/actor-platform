//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/ActorScope.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/ActorScope.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorScope.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorDispatcher.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorEndpoint.h"
#include "im/actor/model/droidkit/actors/mailbox/Mailbox.h"

@interface DKActorScope () {
 @public
  NSString *path_;
  DKProps *props_;
  DKActorRef *actorRef_;
  DKMailbox *mailbox_;
  DKActorDispatcher *dispatcher_;
  DKActorSystem *actorSystem_;
  DKActor *actor_;
  DKActorRef *sender_;
  DKActorEndpoint *endpoint_;
}

@end

J2OBJC_FIELD_SETTER(DKActorScope, path_, NSString *)
J2OBJC_FIELD_SETTER(DKActorScope, props_, DKProps *)
J2OBJC_FIELD_SETTER(DKActorScope, actorRef_, DKActorRef *)
J2OBJC_FIELD_SETTER(DKActorScope, mailbox_, DKMailbox *)
J2OBJC_FIELD_SETTER(DKActorScope, dispatcher_, DKActorDispatcher *)
J2OBJC_FIELD_SETTER(DKActorScope, actorSystem_, DKActorSystem *)
J2OBJC_FIELD_SETTER(DKActorScope, actor_, DKActor *)
J2OBJC_FIELD_SETTER(DKActorScope, sender_, DKActorRef *)
J2OBJC_FIELD_SETTER(DKActorScope, endpoint_, DKActorEndpoint *)


#line 13
@implementation DKActorScope


#line 31
- (instancetype)initWithDKActorSystem:(DKActorSystem *)actorSystem
                        withDKMailbox:(DKMailbox *)mailbox
                withDKActorDispatcher:(DKActorDispatcher *)dispatcher
                         withNSString:(NSString *)path
                          withDKProps:(DKProps *)props
                  withDKActorEndpoint:(DKActorEndpoint *)endpoint {
  DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(self, actorSystem, mailbox, dispatcher, path, props, endpoint);
  return self;
}


#line 42
- (DKActorEndpoint *)getEndpoint {
  return endpoint_;
}

- (DKActorDispatcher *)getDispatcher {
  return dispatcher_;
}

- (NSString *)getPath {
  return path_;
}

- (DKProps *)getProps {
  return props_;
}

- (DKActorRef *)getActorRef {
  return actorRef_;
}

- (DKMailbox *)getMailbox {
  return mailbox_;
}

- (DKActor *)getActor {
  return actor_;
}

- (DKActorSystem *)getActorSystem {
  return actorSystem_;
}

- (DKActorRef *)getSender {
  return sender_;
}

- (void)setSenderWithDKActorRef:(DKActorRef *)sender {
  self->sender_ = sender;
}

- (void)onActorCreatedWithDKActor:(DKActor *)actor {
  self->actor_ = actor;
}

- (void)onActorDie {
  self->actor_ = nil;
}

@end


#line 31
void DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(DKActorScope *self, DKActorSystem *actorSystem, DKMailbox *mailbox, DKActorDispatcher *dispatcher, NSString *path, DKProps *props, DKActorEndpoint *endpoint) {
  (void) NSObject_init(self);
  self->actorSystem_ = actorSystem;
  self->mailbox_ = mailbox;
  self->actorRef_ = new_DKActorRef_initWithDKActorEndpoint_withDKActorSystem_withDKActorDispatcher_withNSString_(endpoint, actorSystem, dispatcher, path);
  self->dispatcher_ = dispatcher;
  self->path_ = path;
  self->props_ = props;
  self->endpoint_ = endpoint;
}


#line 31
DKActorScope *new_DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(DKActorSystem *actorSystem, DKMailbox *mailbox, DKActorDispatcher *dispatcher, NSString *path, DKProps *props, DKActorEndpoint *endpoint) {
  DKActorScope *self = [DKActorScope alloc];
  DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(self, actorSystem, mailbox, dispatcher, path, props, endpoint);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKActorScope)
