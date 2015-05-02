//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/jvm/threads/JavaAtomicLong.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/jvm/threads/JavaAtomicLong.java"

#include "J2ObjC_source.h"
#include "im/actor/model/jvm/threads/JavaAtomicLong.h"
#include "im/actor/model/util/AtomicLongCompat.h"
#include "java/util/concurrent/atomic/AtomicLong.h"

@implementation ImActorModelJvmThreadsJavaAtomicLong


#line 13
- (instancetype)initWithLong:(jlong)value {
  ImActorModelJvmThreadsJavaAtomicLong_initWithLong_(self, value);
  return self;
}

- (jlong)get {
  return [((JavaUtilConcurrentAtomicAtomicLong *) nil_chk(atomicLong_)) get];
}


#line 23
- (jlong)incrementAndGet {
  return [((JavaUtilConcurrentAtomicAtomicLong *) nil_chk(atomicLong_)) incrementAndGet];
}


#line 28
- (jlong)getAndIncrement {
  return [((JavaUtilConcurrentAtomicAtomicLong *) nil_chk(atomicLong_)) getAndIncrement];
}


#line 33
- (void)setWithLong:(jlong)v {
  [((JavaUtilConcurrentAtomicAtomicLong *) nil_chk(atomicLong_)) setWithLong:v];
}

@end


#line 13
void ImActorModelJvmThreadsJavaAtomicLong_initWithLong_(ImActorModelJvmThreadsJavaAtomicLong *self, jlong value) {
  (void) AMAtomicLongCompat_init(self);
  
#line 14
  self->atomicLong_ = new_JavaUtilConcurrentAtomicAtomicLong_initWithLong_(value);
}


#line 13
ImActorModelJvmThreadsJavaAtomicLong *new_ImActorModelJvmThreadsJavaAtomicLong_initWithLong_(jlong value) {
  ImActorModelJvmThreadsJavaAtomicLong *self = [ImActorModelJvmThreadsJavaAtomicLong alloc];
  ImActorModelJvmThreadsJavaAtomicLong_initWithLong_(self, value);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelJvmThreadsJavaAtomicLong)
