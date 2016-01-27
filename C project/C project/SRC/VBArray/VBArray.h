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

typedef struct VBArray VBArray;

struct VBArray {
    VBObject _super;
    void *_arrayData[kVBArrayCount];
    uint16_t _arrayCount;
};

extern
void *VBArrayCreate(void);

extern
void VBArrayRemoveAllElements(VBArray *array);

extern
void VBArraySetDatadAtIndex(VBArray *array, void *data, uint8_t index);

extern
void *VBArrayGetDataAtIndex(VBArray *array, uint8_t index);

extern
void VBArrayAddData(void *array, void *data);

extern
void VBArrayRemoveData(VBArray *array, void *data);

extern
void VBArrayRemoveDataAtIndex(VBArray *array, uint8_t index);

#endif /* VBArray_h */
