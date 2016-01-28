//
//  VBArray.h
//  C project
//
//  Created by Vladimir Budniy on 27.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBArray_h
#define VBArray_h

#include <stdio.h>
#include <stdbool.h>

#include "VBMacroHeader.h"
#include "VBObject.h"

static const uint16_t kVBArrayCount = 20;

extern const uint16_t kVBUndefindeIndex;

typedef struct VBArray VBArray;

struct VBArray {
    VBObject _super;
    void *_arrayData[kVBArrayCount];
};

extern
void *VBArrayCreate(void);

extern
void VBArrayRemoveAllElements(VBArray *array);

extern
void VBArraySetObjectAtIndex(VBArray *array, void *data, uint16_t index);

extern
void *VBArrayGetObjectAtIndex(VBArray *array, uint16_t index);

extern
void VBArrayAddObject(VBArray *array, void *data);

extern
void VBArrayRemoveObject(VBArray *array, void *data);

extern
void VBArrayRemoveObjectAtIndex(VBArray *array, uint16_t index);

extern
uint16_t VBArrayGetCount(VBArray *array);

#endif /* VBArray_h */
