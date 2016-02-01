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

static const uint64_t kVBArrayCount = 20;

extern const uint64_t kVBUndefindeIndex;

typedef struct VBArray VBArray;

struct VBArray {
    VBObject _super;
    void *_arrayData[kVBArrayCount];
    uint64_t _countObject;
};

extern
void *VBArrayCreate(void);

extern
uint64_t VBArrayGetIndexOfObject(VBArray *array, void *object);

extern
void *VBArrayGetObjectAtIndex(VBArray *array, uint64_t index);

extern
void VBArrayAddObject(VBArray *array, void *object);

extern
void VBArrayRemoveObject(VBArray *array, void *object);

extern
void VBArrayRemoveAllElements(VBArray *array);

extern
uint64_t VBArrayGetCount(VBArray *array);

#endif /* VBArray_h */
