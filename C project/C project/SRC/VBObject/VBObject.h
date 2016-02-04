//
//  VBObject.h
//  C project
//
//  Created by Vladimir Budniy on 20.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBObject_h
#define VBObject_h

#include <stdio.h>

typedef void (VBObjectDeallocator)(void *object);

typedef struct VBObject VBObject;

struct VBObject {
    uint16_t _retainCount;
    VBObjectDeallocator *_deallocator;
};

#define VBObjectCreate(type) \
    __VBObjectCreate(sizeof(type), (VBObjectDeallocator *)__##type##Deallocate);

extern
void __VBObjectDeallocate(void *object);

extern
void *__VBObjectCreate(size_t size, VBObjectDeallocator *deallocator);

extern
void *VBObjectRetain(void *object);

extern
void VBObjectRelease(void *object);

extern
uint64_t VBObjectGetRetaineCount(void *object);

#endif /* VBObject_h */
