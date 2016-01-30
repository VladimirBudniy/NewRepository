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
uint16_t VBArrayGetIndexOfObject(VBArray *array, void *object);

static
void VBArrayShiftForIndex(VBArray *array, uint16_t index);

static
void VBArrayAddCountObject(VBArray *array);

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


void VBArraySetObjectAtIndex(VBArray *array, void *object, uint16_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetCount(array) == kVBArrayCount) {
        return;
    }
    
    VBRetainMacro(array->_arrayData[index], object);
    VBArrayAddCountObject(array);
}

void *VBArrayGetObjectAtIndex(VBArray *array, uint16_t index) {
    VBReturnNullMacro(array);
    
    return array->_arrayData[index];
}

uint16_t VBArrayGetCount(VBArray *array) {
    return array->_countObject;
}

void VBArrayAddObject(VBArray *array, void *object) {
    VBReturnMacro(array);
    
    uint16_t index = VBArrayGetIndexOfObject(array, NULL);
    if (index != kVBUndefindeIndex) {
        VBArraySetObjectAtIndex(array, object, index);
    }
}

void VBArrayRemoveObjectAtIndex(VBArray *array, uint16_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetObjectAtIndex(array, index) != NULL) {
        VBArraySetObjectAtIndex(array, NULL, index);
    }
}

void VBArrayRemoveObject(VBArray *array, void *object) {

    VBReturnMacro(array);
    
    uint16_t index = VBArrayGetIndexOfObject(array, object);
    if (index != kVBUndefindeIndex) {
        VBArrayRemoveObjectAtIndex(array, index);
        VBArrayShiftForIndex(array, index);
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

uint16_t VBArrayGetIndexOfObject(VBArray *array, void *object) {
    VBReturnValueMacro(array);
    
    for (int index = 0; index < kVBArrayCount; index++) {
        if (VBArrayGetObjectAtIndex(array, index) == object) {
            return index;
        }
    }
    
    return kVBUndefindeIndex;
}

void VBArrayShiftForIndex(VBArray *array, uint16_t index) {
    VBReturnMacro(array);
    
    for (; index < VBArrayGetCount(array); index++) {
        void *firstObject = VBArrayGetObjectAtIndex(array, index);
        void *secondObject = VBArrayGetObjectAtIndex(array, index + 1);
        
        if (firstObject == NULL) {
            VBArraySetObjectAtIndex(array, secondObject, index);
            VBArraySetObjectAtIndex(array, NULL, index + 1);
        }
    }
}

void VBArrayAddCountObject(VBArray *array) {
    VBReturnMacro(array);
    
    uint16_t count = 0;
    for (int index = 0; index < kVBArrayCount; index++) {
        if (VBArrayGetObjectAtIndex(array, index) != 0) {
            count++;
        }
        
        array->_countObject = count;
    }
}
