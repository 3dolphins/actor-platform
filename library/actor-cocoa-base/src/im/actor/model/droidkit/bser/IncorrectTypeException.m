//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/bser/IncorrectTypeException.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/bser/IncorrectTypeException.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/IncorrectTypeException.h"
#include "java/lang/RuntimeException.h"
#include "java/lang/Throwable.h"


#line 6
@implementation BSIncorrectTypeException


#line 7
- (instancetype)init {
  BSIncorrectTypeException_init(self);
  return self;
}


#line 10
- (instancetype)initWithNSString:(NSString *)detailMessage {
  BSIncorrectTypeException_initWithNSString_(self, detailMessage);
  return self;
}


#line 14
- (instancetype)initWithNSString:(NSString *)detailMessage
           withJavaLangThrowable:(JavaLangThrowable *)throwable {
  BSIncorrectTypeException_initWithNSString_withJavaLangThrowable_(self, detailMessage, throwable);
  return self;
}


#line 18
- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)throwable {
  BSIncorrectTypeException_initWithJavaLangThrowable_(self, throwable);
  return self;
}

@end


#line 7
void BSIncorrectTypeException_init(BSIncorrectTypeException *self) {
  (void) JavaLangRuntimeException_init(self);
}


#line 7
BSIncorrectTypeException *new_BSIncorrectTypeException_init() {
  BSIncorrectTypeException *self = [BSIncorrectTypeException alloc];
  BSIncorrectTypeException_init(self);
  return self;
}


#line 10
void BSIncorrectTypeException_initWithNSString_(BSIncorrectTypeException *self, NSString *detailMessage) {
  (void) JavaLangRuntimeException_initWithNSString_(self, detailMessage);
}


#line 10
BSIncorrectTypeException *new_BSIncorrectTypeException_initWithNSString_(NSString *detailMessage) {
  BSIncorrectTypeException *self = [BSIncorrectTypeException alloc];
  BSIncorrectTypeException_initWithNSString_(self, detailMessage);
  return self;
}


#line 14
void BSIncorrectTypeException_initWithNSString_withJavaLangThrowable_(BSIncorrectTypeException *self, NSString *detailMessage, JavaLangThrowable *throwable) {
  (void) JavaLangRuntimeException_initWithNSString_withJavaLangThrowable_(self, detailMessage, throwable);
}


#line 14
BSIncorrectTypeException *new_BSIncorrectTypeException_initWithNSString_withJavaLangThrowable_(NSString *detailMessage, JavaLangThrowable *throwable) {
  BSIncorrectTypeException *self = [BSIncorrectTypeException alloc];
  BSIncorrectTypeException_initWithNSString_withJavaLangThrowable_(self, detailMessage, throwable);
  return self;
}


#line 18
void BSIncorrectTypeException_initWithJavaLangThrowable_(BSIncorrectTypeException *self, JavaLangThrowable *throwable) {
  (void) JavaLangRuntimeException_initWithJavaLangThrowable_(self, throwable);
}


#line 18
BSIncorrectTypeException *new_BSIncorrectTypeException_initWithJavaLangThrowable_(JavaLangThrowable *throwable) {
  BSIncorrectTypeException *self = [BSIncorrectTypeException alloc];
  BSIncorrectTypeException_initWithJavaLangThrowable_(self, throwable);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(BSIncorrectTypeException)
