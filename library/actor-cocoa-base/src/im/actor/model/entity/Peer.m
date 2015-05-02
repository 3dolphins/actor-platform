//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/Peer.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/Peer.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/PeerType.h"
#include "java/io/IOException.h"

@interface AMPeer () {
 @public
  AMPeerTypeEnum *peerType_;
  jint peerId_;
}

- (instancetype)init;

@end

J2OBJC_FIELD_SETTER(AMPeer, peerType_, AMPeerTypeEnum *)

__attribute__((unused)) static void AMPeer_init(AMPeer *self);

__attribute__((unused)) static AMPeer *new_AMPeer_init() NS_RETURNS_RETAINED;


#line 13
@implementation AMPeer

+ (AMPeer *)fromBytesWithByteArray:(IOSByteArray *)data {
  return AMPeer_fromBytesWithByteArray_(data);
}

+ (AMPeer *)fromUniqueIdWithLong:(jlong)uid {
  return AMPeer_fromUniqueIdWithLong_(uid);
}


#line 34
+ (AMPeer *)userWithInt:(jint)uid {
  return AMPeer_userWithInt_(uid);
}

+ (AMPeer *)groupWithInt:(jint)gid {
  return AMPeer_groupWithInt_(gid);
}


#line 45
- (instancetype)initWithAMPeerTypeEnum:(AMPeerTypeEnum *)peerType
                               withInt:(jint)peerId {
  AMPeer_initWithAMPeerTypeEnum_withInt_(self, peerType, peerId);
  return self;
}


#line 50
- (instancetype)init {
  AMPeer_init(self);
  return self;
}


#line 54
- (jlong)getUnuqueId {
  jint type;
  switch ([peerType_ ordinal]) {
    default:
    case AMPeerType_PRIVATE:
    type = 0;
    break;
    case AMPeerType_GROUP:
    type = 1;
    break;
    case AMPeerType_EMAIL:
    type = 2;
    break;
  }
  return ((jlong) peerId_ & (jlong) 0xFFFFFFFFLL) + (LShift64(((jlong) type & (jlong) 0xFFFFFFFFLL), 32));
}

- (AMPeerTypeEnum *)getPeerType {
  return peerType_;
}

- (jint)getPeerId {
  return peerId_;
}


#line 80
- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  
#line 84
  AMPeer *peer = (AMPeer *) check_class_cast(o, [AMPeer class]);
  
#line 86
  if (peerId_ != ((AMPeer *) nil_chk(peer))->peerId_) return NO;
  if (peerType_ != peer->peerType_) return NO;
  
#line 89
  return YES;
}


#line 93
- (NSUInteger)hash {
  jint result = ((jint) [((AMPeerTypeEnum *) nil_chk(peerType_)) hash]);
  result = 31 * result + peerId_;
  return result;
}


#line 100
- (void)parseWithBSBserValues:(BSBserValues *)values {
  peerId_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  switch ([values getIntWithInt:2]) {
    default:
    case 1:
    peerType_ = AMPeerTypeEnum_get_PRIVATE();
    break;
    case 2:
    peerType_ = AMPeerTypeEnum_get_EMAIL();
    break;
    case 3:
    peerType_ = AMPeerTypeEnum_get_GROUP();
    break;
  }
}


#line 117
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:peerId_];
  switch ([peerType_ ordinal]) {
    default:
    case AMPeerType_PRIVATE:
    [writer writeIntWithInt:2 withInt:1];
    break;
    case AMPeerType_EMAIL:
    [writer writeIntWithInt:2 withInt:2];
    break;
    case AMPeerType_GROUP:
    [writer writeIntWithInt:2 withInt:3];
    break;
  }
}


#line 134
- (NSString *)description {
  return JreStrcat("$@$IC", @"{type:", peerType_, @", id:", peerId_, '}');
}

@end


#line 15
AMPeer *AMPeer_fromBytesWithByteArray_(IOSByteArray *data) {
  AMPeer_initialize();
  
#line 16
  return ((AMPeer *) BSBser_parseWithBSBserObject_withByteArray_(new_AMPeer_init(), data));
}


#line 19
AMPeer *AMPeer_fromUniqueIdWithLong_(jlong uid) {
  AMPeer_initialize();
  
#line 20
  jint id_ = (jint) (uid & (jlong) 0xFFFFFFFFLL);
  jint type = (jint) ((RShift64(uid, 32)) & (jlong) 0xFFFFFFFFLL);
  
#line 23
  switch (type) {
    default:
    case 0:
    return new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum_get_PRIVATE(), id_);
    case 1:
    return new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum_get_GROUP(), id_);
    case 2:
    return new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum_get_EMAIL(), id_);
  }
}


#line 34
AMPeer *AMPeer_userWithInt_(jint uid) {
  AMPeer_initialize();
  
#line 35
  return new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum_get_PRIVATE(), uid);
}


#line 38
AMPeer *AMPeer_groupWithInt_(jint gid) {
  AMPeer_initialize();
  
#line 39
  return new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum_get_GROUP(), gid);
}

void AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeer *self, AMPeerTypeEnum *peerType, jint peerId) {
  (void) BSBserObject_init(self);
  
#line 46
  self->peerType_ = peerType;
  self->peerId_ = peerId;
}


#line 45
AMPeer *new_AMPeer_initWithAMPeerTypeEnum_withInt_(AMPeerTypeEnum *peerType, jint peerId) {
  AMPeer *self = [AMPeer alloc];
  AMPeer_initWithAMPeerTypeEnum_withInt_(self, peerType, peerId);
  return self;
}


#line 50
void AMPeer_init(AMPeer *self) {
  (void) BSBserObject_init(self);
}


#line 50
AMPeer *new_AMPeer_init() {
  AMPeer *self = [AMPeer alloc];
  AMPeer_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMPeer)
