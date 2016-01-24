//
//  VBString.h
//  C project
//
//  Created by Vladimir Budniy on 22.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBString_h
#define VBString_h

#include <stdio.h>
#include <string.h>

#include "VBObject.h"

typedef void (VBStringDeallocator)(void *object);

typedef struct VBString VBString;

struct VBString {
    VBObject _super;
    VBStringDeallocator *_deallocator;
    char *_name;
};

extern
void __VBStringDeallocate(void *string);

extern
void *__VBStringCreateWithName(void *name, VBStringDeallocator *_deallocator);

#define VBStringCreateWithName(type) \
    __VBStringCreateWithName(name, (VBStringDeallocator *)__##type##Deallocate);

extern
void VBStringSetName(void *string, char *name);

extern
void *VBStringGetName(void *string);



#endif /* VBString_h */
