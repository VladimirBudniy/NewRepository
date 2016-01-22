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

typedef struct VBString VBString;

struct VBString {
    VBObject _super;
    char *_name;
};

extern
void __VBStringDeallocate(void *string);

extern
void *VBStringCreateWithName(void *name);

extern
void VBStringSetName(void *string, char *name);

extern
void *VBStringGetName(void *string);



#endif /* VBString_h */
