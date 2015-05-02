//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/content/ServiceGroupUserKicked.java
//

#ifndef _AMServiceGroupUserKicked_H_
#define _AMServiceGroupUserKicked_H_

#include "J2ObjC_header.h"
#include "im/actor/model/entity/content/ServiceContent.h"

@class AMAbsContent_ContentTypeEnum;
@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

@interface AMServiceGroupUserKicked : AMServiceContent

#pragma mark Public

- (instancetype)initWithInt:(jint)kickedUid;

+ (AMServiceGroupUserKicked *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getKickedUid;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

#pragma mark Protected

- (AMAbsContent_ContentTypeEnum *)getContentType;

@end

J2OBJC_EMPTY_STATIC_INIT(AMServiceGroupUserKicked)

FOUNDATION_EXPORT AMServiceGroupUserKicked *AMServiceGroupUserKicked_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void AMServiceGroupUserKicked_initWithInt_(AMServiceGroupUserKicked *self, jint kickedUid);

FOUNDATION_EXPORT AMServiceGroupUserKicked *new_AMServiceGroupUserKicked_initWithInt_(jint kickedUid) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMServiceGroupUserKicked)

typedef AMServiceGroupUserKicked ImActorModelEntityContentServiceGroupUserKicked;

#endif // _AMServiceGroupUserKicked_H_
