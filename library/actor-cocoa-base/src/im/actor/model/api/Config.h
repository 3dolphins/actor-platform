//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/Config.java
//

#ifndef _ImActorModelApiConfig_H_
#define _ImActorModelApiConfig_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/bser/BserObject.h"

@class BSBserValues;
@class BSBserWriter;

@interface ImActorModelApiConfig : BSBserObject

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithInt:(jint)maxGroupSize;

- (jint)getMaxGroupSize;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiConfig)

FOUNDATION_EXPORT void ImActorModelApiConfig_initWithInt_(ImActorModelApiConfig *self, jint maxGroupSize);

FOUNDATION_EXPORT ImActorModelApiConfig *new_ImActorModelApiConfig_initWithInt_(jint maxGroupSize) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void ImActorModelApiConfig_init(ImActorModelApiConfig *self);

FOUNDATION_EXPORT ImActorModelApiConfig *new_ImActorModelApiConfig_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiConfig)

#endif // _ImActorModelApiConfig_H_
