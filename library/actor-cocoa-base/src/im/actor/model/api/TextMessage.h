//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/TextMessage.java
//

#ifndef _ImActorModelApiTextMessage_H_
#define _ImActorModelApiTextMessage_H_

#include "J2ObjC_header.h"
#include "im/actor/model/api/Message.h"

@class BSBserValues;
@class BSBserWriter;
@class ImActorModelApiTextMessageEx;

@interface ImActorModelApiTextMessage : ImActorModelApiMessage

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithNSString:(NSString *)text
withImActorModelApiTextMessageEx:(ImActorModelApiTextMessageEx *)ext;

- (ImActorModelApiTextMessageEx *)getExt;

- (jint)getHeader;

- (NSString *)getText;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiTextMessage)

FOUNDATION_EXPORT void ImActorModelApiTextMessage_initWithNSString_withImActorModelApiTextMessageEx_(ImActorModelApiTextMessage *self, NSString *text, ImActorModelApiTextMessageEx *ext);

FOUNDATION_EXPORT ImActorModelApiTextMessage *new_ImActorModelApiTextMessage_initWithNSString_withImActorModelApiTextMessageEx_(NSString *text, ImActorModelApiTextMessageEx *ext) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void ImActorModelApiTextMessage_init(ImActorModelApiTextMessage *self);

FOUNDATION_EXPORT ImActorModelApiTextMessage *new_ImActorModelApiTextMessage_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiTextMessage)

#endif // _ImActorModelApiTextMessage_H_
