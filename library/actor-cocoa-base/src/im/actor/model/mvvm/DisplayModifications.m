//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/DisplayModifications.java
//


#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/DisplayModifications.java"

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/engine/ListEngineItem.h"
#include "im/actor/model/mvvm/DisplayList.h"
#include "im/actor/model/mvvm/DisplayModifications.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/HashSet.h"
#include "java/util/Iterator.h"
#include "java/util/List.h"

@interface AMDisplayModifications_$1 : NSObject < AMDisplayList_Modification > {
 @public
  id<DKListEngineItem> val$item_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithDKListEngineItem:(id<DKListEngineItem>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$1)

J2OBJC_FIELD_SETTER(AMDisplayModifications_$1, val$item_, id)

__attribute__((unused)) static void AMDisplayModifications_$1_initWithDKListEngineItem_(AMDisplayModifications_$1 *self, id<DKListEngineItem> capture$0);

__attribute__((unused)) static AMDisplayModifications_$1 *new_AMDisplayModifications_$1_initWithDKListEngineItem_(id<DKListEngineItem> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$1)

@interface AMDisplayModifications_$2 : NSObject < AMDisplayList_Modification > {
 @public
  id<JavaUtilList> val$items_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$2)

J2OBJC_FIELD_SETTER(AMDisplayModifications_$2, val$items_, id<JavaUtilList>)

__attribute__((unused)) static void AMDisplayModifications_$2_initWithJavaUtilList_(AMDisplayModifications_$2 *self, id<JavaUtilList> capture$0);

__attribute__((unused)) static AMDisplayModifications_$2 *new_AMDisplayModifications_$2_initWithJavaUtilList_(id<JavaUtilList> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$2)

@interface AMDisplayModifications_$3 : NSObject < AMDisplayList_Modification > {
 @public
  id<JavaUtilList> val$items_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$3)

J2OBJC_FIELD_SETTER(AMDisplayModifications_$3, val$items_, id<JavaUtilList>)

__attribute__((unused)) static void AMDisplayModifications_$3_initWithJavaUtilList_(AMDisplayModifications_$3 *self, id<JavaUtilList> capture$0);

__attribute__((unused)) static AMDisplayModifications_$3 *new_AMDisplayModifications_$3_initWithJavaUtilList_(id<JavaUtilList> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$3)

@interface AMDisplayModifications_$4 : NSObject < AMDisplayList_Modification > {
 @public
  id<JavaUtilList> val$items_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$4)

J2OBJC_FIELD_SETTER(AMDisplayModifications_$4, val$items_, id<JavaUtilList>)

__attribute__((unused)) static void AMDisplayModifications_$4_initWithJavaUtilList_(AMDisplayModifications_$4 *self, id<JavaUtilList> capture$0);

__attribute__((unused)) static AMDisplayModifications_$4 *new_AMDisplayModifications_$4_initWithJavaUtilList_(id<JavaUtilList> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$4)

@interface AMDisplayModifications_$5 : NSObject < AMDisplayList_Modification > {
 @public
  jlong val$dstId_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithLong:(jlong)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$5)

__attribute__((unused)) static void AMDisplayModifications_$5_initWithLong_(AMDisplayModifications_$5 *self, jlong capture$0);

__attribute__((unused)) static AMDisplayModifications_$5 *new_AMDisplayModifications_$5_initWithLong_(jlong capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$5)

@interface AMDisplayModifications_$6 : NSObject < AMDisplayList_Modification > {
 @public
  IOSLongArray *val$dstIds_;
}

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)initWithLongArray:(IOSLongArray *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$6)

J2OBJC_FIELD_SETTER(AMDisplayModifications_$6, val$dstIds_, IOSLongArray *)

__attribute__((unused)) static void AMDisplayModifications_$6_initWithLongArray_(AMDisplayModifications_$6 *self, IOSLongArray *capture$0);

__attribute__((unused)) static AMDisplayModifications_$6 *new_AMDisplayModifications_$6_initWithLongArray_(IOSLongArray *capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$6)

@interface AMDisplayModifications_$7 : NSObject < AMDisplayList_Modification >

- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(AMDisplayModifications_$7)

__attribute__((unused)) static void AMDisplayModifications_$7_init(AMDisplayModifications_$7 *self);

__attribute__((unused)) static AMDisplayModifications_$7 *new_AMDisplayModifications_$7_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMDisplayModifications_$7)


#line 13
@implementation AMDisplayModifications

+ (id<AMDisplayList_Modification>)addOrUpdateWithDKListEngineItem:(id<DKListEngineItem>)item {
  return AMDisplayModifications_addOrUpdateWithDKListEngineItem_(item);
}


#line 34
+ (id<AMDisplayList_Modification>)addOrUpdateWithJavaUtilList:(id<JavaUtilList>)items {
  return AMDisplayModifications_addOrUpdateWithJavaUtilList_(items);
}


#line 55
+ (id<AMDisplayList_Modification>)addOnlyWithJavaUtilList:(id<JavaUtilList>)items {
  return AMDisplayModifications_addOnlyWithJavaUtilList_(items);
}


#line 76
+ (id<AMDisplayList_Modification>)replaceWithJavaUtilList:(id<JavaUtilList>)items {
  return AMDisplayModifications_replaceWithJavaUtilList_(items);
}


#line 86
+ (id<AMDisplayList_Modification>)removeWithLong:(jlong)dstId {
  return AMDisplayModifications_removeWithLong_(dstId);
}


#line 101
+ (id<AMDisplayList_Modification>)removeWithLongArray:(IOSLongArray *)dstIds {
  return AMDisplayModifications_removeWithLongArray_(dstIds);
}


#line 120
+ (id<AMDisplayList_Modification>)clear {
  return AMDisplayModifications_clear();
}

- (instancetype)init {
  AMDisplayModifications_init(self);
  return self;
}

@end


#line 15
id<AMDisplayList_Modification> AMDisplayModifications_addOrUpdateWithDKListEngineItem_(id<DKListEngineItem> item) {
  AMDisplayModifications_initialize();
  
#line 16
  return new_AMDisplayModifications_$1_initWithDKListEngineItem_(item);
}


#line 34
id<AMDisplayList_Modification> AMDisplayModifications_addOrUpdateWithJavaUtilList_(id<JavaUtilList> items) {
  AMDisplayModifications_initialize();
  
#line 35
  return new_AMDisplayModifications_$2_initWithJavaUtilList_(items);
}


#line 55
id<AMDisplayList_Modification> AMDisplayModifications_addOnlyWithJavaUtilList_(id<JavaUtilList> items) {
  AMDisplayModifications_initialize();
  
#line 56
  return new_AMDisplayModifications_$3_initWithJavaUtilList_(items);
}


#line 76
id<AMDisplayList_Modification> AMDisplayModifications_replaceWithJavaUtilList_(id<JavaUtilList> items) {
  AMDisplayModifications_initialize();
  
#line 77
  return new_AMDisplayModifications_$4_initWithJavaUtilList_(items);
}


#line 86
id<AMDisplayList_Modification> AMDisplayModifications_removeWithLong_(jlong dstId) {
  AMDisplayModifications_initialize();
  
#line 87
  return new_AMDisplayModifications_$5_initWithLong_(dstId);
}


#line 101
id<AMDisplayList_Modification> AMDisplayModifications_removeWithLongArray_(IOSLongArray *dstIds) {
  AMDisplayModifications_initialize();
  
#line 102
  return new_AMDisplayModifications_$6_initWithLongArray_(dstIds);
}


#line 120
id<AMDisplayList_Modification> AMDisplayModifications_clear() {
  AMDisplayModifications_initialize();
  
#line 121
  return new_AMDisplayModifications_$7_init();
}

void AMDisplayModifications_init(AMDisplayModifications *self) {
  (void) NSObject_init(self);
}

AMDisplayModifications *new_AMDisplayModifications_init() {
  AMDisplayModifications *self = [AMDisplayModifications alloc];
  AMDisplayModifications_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications)

@implementation AMDisplayModifications_$1


#line 18
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  jlong dstId = [((id<DKListEngineItem>) nil_chk(val$item_)) getEngineId];
  
#line 21
  id<JavaUtilIterator> iterator = [((id<JavaUtilList>) nil_chk(sourceList)) iterator];
  while ([((id<JavaUtilIterator>) nil_chk(iterator)) hasNext]) {
    id<DKListEngineItem> src = [iterator next];
    if ([((id<DKListEngineItem>) nil_chk(src)) getEngineId] == dstId) {
      [iterator remove];
    }
  }
  
#line 29
  [sourceList addWithId:val$item_];
}

- (instancetype)initWithDKListEngineItem:(id<DKListEngineItem>)capture$0 {
  AMDisplayModifications_$1_initWithDKListEngineItem_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$1_initWithDKListEngineItem_(AMDisplayModifications_$1 *self, id<DKListEngineItem> capture$0) {
  self->val$item_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$1 *new_AMDisplayModifications_$1_initWithDKListEngineItem_(id<DKListEngineItem> capture$0) {
  AMDisplayModifications_$1 *self = [AMDisplayModifications_$1 alloc];
  AMDisplayModifications_$1_initWithDKListEngineItem_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$1)

@implementation AMDisplayModifications_$2


#line 37
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  JavaUtilHashSet *keys = new_JavaUtilHashSet_init();
  for (id<DKListEngineItem> __strong i in nil_chk(val$items_)) {
    [keys addWithId:JavaLangLong_valueOfWithLong_([((id<DKListEngineItem>) nil_chk(i)) getEngineId])];
  }
  id<JavaUtilIterator> iterator = [((id<JavaUtilList>) nil_chk(sourceList)) iterator];
  while ([((id<JavaUtilIterator>) nil_chk(iterator)) hasNext]) {
    id<DKListEngineItem> src = [iterator next];
    if ([keys containsWithId:JavaLangLong_valueOfWithLong_([((id<DKListEngineItem>) nil_chk(src)) getEngineId])]) {
      [iterator remove];
    }
  }
  
#line 50
  [sourceList addAllWithJavaUtilCollection:val$items_];
}

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0 {
  AMDisplayModifications_$2_initWithJavaUtilList_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$2_initWithJavaUtilList_(AMDisplayModifications_$2 *self, id<JavaUtilList> capture$0) {
  self->val$items_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$2 *new_AMDisplayModifications_$2_initWithJavaUtilList_(id<JavaUtilList> capture$0) {
  AMDisplayModifications_$2 *self = [AMDisplayModifications_$2 alloc];
  AMDisplayModifications_$2_initWithJavaUtilList_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$2)

@implementation AMDisplayModifications_$3


#line 58
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  
#line 60
  JavaUtilArrayList *toAdd = new_JavaUtilArrayList_init();
  
#line 62
  for (id<DKListEngineItem> __strong t in nil_chk(val$items_)) {
    {
      
#line 63
      for (id<DKListEngineItem> __strong srcT in nil_chk(sourceList)) {
        if ([((id<DKListEngineItem>) nil_chk(srcT)) getEngineId] == [((id<DKListEngineItem>) nil_chk(t)) getEngineId]) {
          goto continue_outer;
        }
      }
      [toAdd addWithId:t];
    }
    continue_outer: ;
  }
  
#line 71
  [((id<JavaUtilList>) nil_chk(sourceList)) addAllWithJavaUtilCollection:toAdd];
}

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0 {
  AMDisplayModifications_$3_initWithJavaUtilList_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$3_initWithJavaUtilList_(AMDisplayModifications_$3 *self, id<JavaUtilList> capture$0) {
  self->val$items_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$3 *new_AMDisplayModifications_$3_initWithJavaUtilList_(id<JavaUtilList> capture$0) {
  AMDisplayModifications_$3 *self = [AMDisplayModifications_$3 alloc];
  AMDisplayModifications_$3_initWithJavaUtilList_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$3)

@implementation AMDisplayModifications_$4


#line 79
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  [((id<JavaUtilList>) nil_chk(sourceList)) clear];
  [sourceList addAllWithJavaUtilCollection:val$items_];
}

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)capture$0 {
  AMDisplayModifications_$4_initWithJavaUtilList_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$4_initWithJavaUtilList_(AMDisplayModifications_$4 *self, id<JavaUtilList> capture$0) {
  self->val$items_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$4 *new_AMDisplayModifications_$4_initWithJavaUtilList_(id<JavaUtilList> capture$0) {
  AMDisplayModifications_$4 *self = [AMDisplayModifications_$4 alloc];
  AMDisplayModifications_$4_initWithJavaUtilList_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$4)

@implementation AMDisplayModifications_$5


#line 89
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  id<JavaUtilIterator> iterator = [((id<JavaUtilList>) nil_chk(sourceList)) iterator];
  while ([((id<JavaUtilIterator>) nil_chk(iterator)) hasNext]) {
    id<DKListEngineItem> src = [iterator next];
    if ([((id<DKListEngineItem>) nil_chk(src)) getEngineId] == val$dstId_) {
      [iterator remove];
    }
  }
}

- (instancetype)initWithLong:(jlong)capture$0 {
  AMDisplayModifications_$5_initWithLong_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$5_initWithLong_(AMDisplayModifications_$5 *self, jlong capture$0) {
  self->val$dstId_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$5 *new_AMDisplayModifications_$5_initWithLong_(jlong capture$0) {
  AMDisplayModifications_$5 *self = [AMDisplayModifications_$5 alloc];
  AMDisplayModifications_$5_initWithLong_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$5)

@implementation AMDisplayModifications_$6


#line 104
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  id<JavaUtilIterator> it = [((id<JavaUtilList>) nil_chk(sourceList)) iterator];
  while ([((id<JavaUtilIterator>) nil_chk(it)) hasNext]) {
    id<DKListEngineItem> value = [it next];
    jlong srcId = [((id<DKListEngineItem>) nil_chk(value)) getEngineId];
    {
      IOSLongArray *a__ = val$dstIds_;
      jlong const *b__ = ((IOSLongArray *) nil_chk(a__))->buffer_;
      jlong const *e__ = b__ + a__->size_;
      while (b__ < e__) {
        jlong dstId = *b__++;
        
#line 110
        if (dstId == srcId) {
          [it remove];
          break;
        }
      }
    }
  }
}

- (instancetype)initWithLongArray:(IOSLongArray *)capture$0 {
  AMDisplayModifications_$6_initWithLongArray_(self, capture$0);
  return self;
}

@end

void AMDisplayModifications_$6_initWithLongArray_(AMDisplayModifications_$6 *self, IOSLongArray *capture$0) {
  self->val$dstIds_ = capture$0;
  (void) NSObject_init(self);
}

AMDisplayModifications_$6 *new_AMDisplayModifications_$6_initWithLongArray_(IOSLongArray *capture$0) {
  AMDisplayModifications_$6 *self = [AMDisplayModifications_$6 alloc];
  AMDisplayModifications_$6_initWithLongArray_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$6)

@implementation AMDisplayModifications_$7


#line 123
- (void)modifyWithJavaUtilList:(id<JavaUtilList>)sourceList {
  [((id<JavaUtilList>) nil_chk(sourceList)) clear];
}

- (instancetype)init {
  AMDisplayModifications_$7_init(self);
  return self;
}

@end

void AMDisplayModifications_$7_init(AMDisplayModifications_$7 *self) {
  (void) NSObject_init(self);
}

AMDisplayModifications_$7 *new_AMDisplayModifications_$7_init() {
  AMDisplayModifications_$7 *self = [AMDisplayModifications_$7 alloc];
  AMDisplayModifications_$7_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDisplayModifications_$7)
