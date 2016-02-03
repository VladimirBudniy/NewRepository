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

extern const uint64_t kVBUndefindeIndex;

typedef struct VBArray VBArray;

struct VBArray {
    VBObject _super;
    void **_arrayData;
    uint64_t _countObject;
    uint64_t _capacity;
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

extern
uint64_t VBArrayGetCapacity(VBArray *array);

extern
void VBArrayAddObjectAtIndex(VBArray *array, void *object, int64_t index);

extern
void *VBArrayGetFirstObject(VBArray *array);

extern
void *VBArrayGetLastObject(VBArray *array);

#endif /* VBArray_h */
