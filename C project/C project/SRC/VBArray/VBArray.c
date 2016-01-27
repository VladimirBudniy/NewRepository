//
//  VBArray.c
//  C project
//
//  Created by Vladimir Budniy on 27.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBArray.h"

#pragma mark-
#pragma mark Private Declarations

static
void __VBArrayDeallocate(void *string);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBArrayDeallocate(void *array) {
    VBArrayRemoveAllElements(array);
    
    __VBObjectDeallocate(array);
}

void *VBArrayCreate(void) {
    VBArray *array = VBObjectCreate(VBArray);
    
    return array;
}

#pragma mark-
#pragma mark Accessors


void VBArraySetDatadAtIndex(VBArray *array, void *data, uint8_t index) {
    VBReturnMacro(array);
    
    VBRetainMacro(array->_arrayData[index], data);
}

void *VBArrayGetDataAtIndex(VBArray *array, uint8_t index) {
    VBReturnNullMacro(array);
    
    return array->_arrayData[index];
}

void VBArrayAddData(void *array, void *data) {
    VBReturnMacro(array);
    
    int index = 0;
    for (index = 0; VBArrayGetDataAtIndex(array, index) != NULL; index++) {
        if (index == (kVBArrayCount - 1)) {
            return;
        }
    }
    
    VBArraySetDatadAtIndex(array, data, index);
}

void VBArrayRemoveDataAtIndex(VBArray *array, uint8_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetDataAtIndex(array, index) != NULL) {
        VBArraySetDatadAtIndex(array, NULL, index);
    }
}

void VBArrayRemoveData(VBArray *array, void *data) {
    VBReturnMacro(array);
    
    for (int index = 0; index < kVBArrayCount; index++) {
        if (VBArrayGetDataAtIndex(array, index) == data) {
            VBArrayRemoveDataAtIndex(array, index);
        }
    }
}

void VBArrayRemoveAllElements(VBArray *array) {
    VBReturnMacro(array);
    
    for (int index = 0; index < kVBArrayCount; index++) {
        VBArrayRemoveDataAtIndex(array, index);
    }
}