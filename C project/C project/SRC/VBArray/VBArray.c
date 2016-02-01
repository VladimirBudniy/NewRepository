//
//  VBArray.c
//  C project
//
//  Created by Vladimir Budniy on 27.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBArray.h"

#include <stdlib.h>
#include <assert.h>

const uint64_t kVBUndefindeIndex = UINT16_MAX;

#pragma mark-
#pragma mark Private Declarations

static
void __VBArrayDeallocate(void *array);

static
void VBArraySetObjectAtIndex(VBArray *array, void *object, uint64_t index);

static
void VBArrayShiftForIndex(VBArray *array, uint64_t index);

static
void VBArrayRemoveObjectAtIndex(VBArray *array, uint64_t index);

static
void VBArraySetCount(VBArray *array, uint64_t count);

static
void VBArraySetData(VBArray *array, void **data);

//static
//void **VBArrayGetData(VBArray *array);

static
void VBArraySetCapacity(VBArray *array, uint64_t capacity);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBArrayDeallocate(void *array) {
    VBArrayRemoveAllElements(array);
    
    __VBObjectDeallocate(array);
}

void *VBArrayCreate(void) {
    VBArray *array = VBObjectCreate(VBArray);
    VBArraySetCapacity(array, 0);
//    array->_arrayData = calloc(0, sizeof(void *));
    VBArraySetCount(array, 0);
    
    return array;
}

#pragma mark-
#pragma mark Accessors


void VBArraySetCapacity(VBArray *array, uint64_t capacity) {
    VBAssignMacro(array->_capacity, capacity);
    
    size_t size = sizeof(void *);
    
    void **pointer = realloc(array->_arrayData, array->_capacity * size);
    VBArraySetData(array, pointer);
}

uint64_t VBArrayGetCapacity(VBArray *array) {
    return array->_capacity;
}

void VBArraySetData(VBArray *array, void **data) {
    VBAssignMacro(array->_arrayData, data);
}

void VBArraySetObjectAtIndex(VBArray *array, void *object, uint64_t index) {
    VBReturnMacro(array);
    
    VBRetainMacro(array->_arrayData[index], object);
}

void *VBArrayGetObjectAtIndex(VBArray *array, uint64_t index) {
    VBReturnNullMacro(array);
    
    return array->_arrayData[index];
}

void VBArraySetCount(VBArray *array, uint64_t count) {
    VBReturnMacro(array);
    
    VBAssignMacro(array->_countObject, count);
}

uint64_t VBArrayGetCount(VBArray *array) {
    return array->_countObject;
}

void VBArrayAddObject(VBArray *array, void *object) {
    VBReturnMacro(array);
    
    VBArraySetCapacity(array, VBArrayGetCount(array) + 1);
    
    uint64_t index = VBArrayGetIndexOfObject(array, NULL);
    
    VBArraySetObjectAtIndex(array, object, index);
    VBArraySetCount(array, VBArrayGetCount(array) + 1);
}

void VBArrayRemoveObjectAtIndex(VBArray *array, uint64_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetObjectAtIndex(array, index) != NULL) {
        VBArraySetObjectAtIndex(array, NULL, index);
        VBArraySetCount(array, VBArrayGetCount(array) - 1);
    }
    
    VBArraySetCapacity(array, VBArrayGetCount(array));
}

void VBArrayRemoveObject(VBArray *array, void *object) {

    VBReturnMacro(array);
    
    uint64_t index = VBArrayGetIndexOfObject(array, object);
    VBArrayRemoveObjectAtIndex(array, index);
    VBArrayShiftForIndex(array, index);
}

void VBArrayRemoveAllElements(VBArray *array) {
    VBReturnMacro(array);
    
    for (int index = 0; index <= VBArrayGetCount(array); index++) {
        VBArrayRemoveObjectAtIndex(array, index);
    }
}

#pragma mark - 
#pragma mark Private

uint64_t VBArrayGetIndexOfObject(VBArray *array, void *object) {
    VBReturnValueMacro(array);
    
    for (int index = 0; index <= VBArrayGetCount(array); index++) {
        if (VBArrayGetObjectAtIndex(array, index) == object) {
            return index;
        }
    }
    
    return kVBUndefindeIndex;
}

void VBArrayShiftForIndex(VBArray *array, uint64_t index) {
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
