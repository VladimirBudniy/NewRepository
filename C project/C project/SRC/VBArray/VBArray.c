//
//  VBArray.c
//  C project
//
//  Created by Vladimir Budniy on 27.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBArray.h"

const uint16_t kVBUndefindeIndex = UINT16_MAX;

#pragma mark-
#pragma mark Private Declarations

static
void __VBArrayDeallocate(void *array);

static
uint16_t VBArrayGetIndexOfObject(VBArray *array, void *data);

static
void VBArraySorting(VBArray *array, uint16_t index);

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


void VBArraySetObjectAtIndex(VBArray *array, void *data, uint16_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetCount(array) == kVBArrayCount) {
        return;
    }
    
    VBRetainMacro(array->_arrayData[index], data);
}

void *VBArrayGetObjectAtIndex(VBArray *array, uint16_t index) {
    VBReturnNullMacro(array);
    
    return array->_arrayData[index];
}

uint16_t VBArrayGetCount(VBArray *array) {
    uint16_t count = VBArrayGetIndexOfObject(array, NULL);
    
    return kVBUndefindeIndex != count ? count : kVBArrayCount;
}

void VBArrayAddObject(VBArray *array, void *data) {
    VBReturnMacro(array);
    
    if (VBArrayGetIndexOfObject(array, NULL) != kVBUndefindeIndex) {
        VBArraySetObjectAtIndex(array, data, VBArrayGetIndexOfObject(array, NULL));
    } else {
        NULL;
    }
}

void VBArrayRemoveObjectAtIndex(VBArray *array, uint16_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetObjectAtIndex(array, index) != NULL) {
        VBArraySetObjectAtIndex(array, NULL, index);
        VBArraySorting(array, index);
    }
}

void VBArrayRemoveObject(VBArray *array, void *data) {
    VBReturnMacro(array);
    
    if (VBArrayGetIndexOfObject(array, data) != kVBUndefindeIndex) {
        VBArrayRemoveObjectAtIndex(array, VBArrayGetIndexOfObject(array, data));
    } else {
        NULL;
    }
}

void VBArrayRemoveAllElements(VBArray *array) {
    VBReturnMacro(array);
    
    for (int index = 0; index < kVBArrayCount; index++) {
        VBArrayRemoveObjectAtIndex(array, index);
    }
}

#pragma mark - 
#pragma mark Private

uint16_t VBArrayGetIndexOfObject(VBArray *array, void *data) {
    for (int index = 0; index < kVBArrayCount; index++) {
        if (VBArrayGetObjectAtIndex(array, index) == data) {
            return index;
        }
    }
    
    return kVBUndefindeIndex;
}

void VBArraySorting(VBArray *array, uint16_t index) {
    VBReturnMacro(array);
    
    void *firstObject = VBArrayGetObjectAtIndex(array, index);
    void *secondObject = VBArrayGetObjectAtIndex(array, index + 1);
    
    if ((firstObject == NULL) && (secondObject != NULL)) {
        VBArraySetObjectAtIndex(array, secondObject, index);
        VBArraySetObjectAtIndex(array, NULL, index + 1);
    }
}
