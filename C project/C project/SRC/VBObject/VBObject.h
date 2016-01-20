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

typedef struct VBObject VBObject;

struct VBObject {
    uint16_t _retainCount;
};

extern
void __VBObjectDeallocate(VBObject *object);

extern
void *__VBObjectCreate(size_t size);

extern
void *VBObjectRetain(VBObject *object);

extern
void VBObjectRelease(VBObject *object);

#endif /* VBObject_h */
