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
#include <string.h>

static const uint64_t kVBArrayStockValue     = 5;
static const float    kVBArrayIncreaseValue  = 1.2;
static const float    kVBArrayDecreaseValue  = 0.8;

const uint64_t kVBUndefindeIndex = UINT64_MAX;

#pragma mark-
#pragma mark Private Declarations

static
void __VBArrayDeallocate(void *array);

static
void VBArrayShiftFromIndex(VBArray *array, uint64_t index);

static
void VBArraySetCount(VBArray *array, uint64_t count);

static
void VBArraySetData(VBArray *array, void **data);

static
void **VBArrayGetData(VBArray *array);

static
void VBArraySetCapacity(VBArray *array, uint64_t capacity);

static
bool VBArrayNeedChangeSize(VBArray *array);

static
void VBArrayChangeSizeIfNeeded(VBArray *array);

static
uint64_t VBArrayProvideSize(VBArray *array);

static
void VBArrayAddObjectAtIndex(VBArray *array, void *object, int64_t index);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBArrayDeallocate(void *array) {
    VBArrayRemoveAllObjects(array);
    
    __VBObjectDeallocate(array);
}

VBArray *VBArrayCreate(void) {
    VBArray *array = VBObjectCreate(VBArray);
    VBArraySetCapacity(array, 0);
    VBArraySetCount(array, 0);
    
    return array;
}

#pragma mark-
#pragma mark Accessors

uint64_t VBArrayGetCapacity(VBArray *array) {
    return array->_capacity;
}

void VBArraySetData(VBArray *array, void **data) {
    VBReturnMacro(array);
    
    VBAssignMacro(array->_arrayData, data);
}

void **VBArrayGetData(VBArray *array) {
    VBReturnValueMacro(array, NULL);
    
    return array->_arrayData;
}

void VBArraySetObjectAtIndex(VBArray *array, void *object, uint64_t index) {
    VBReturnMacro(array);
    
    VBRetainMacro(array->_arrayData[index], object);
}

void *VBArrayGetObjectAtIndex(VBArray *array, uint64_t index) {
    VBReturnValueMacro(array, NULL);
    
    return array->_arrayData[index];
}

void VBArraySetCount(VBArray *array, uint64_t count) {
    VBReturnMacro(array);
    
    VBAssignMacro(array->_countObject, count);
}

uint64_t VBArrayGetCount(VBArray *array) {
    return array->_countObject;
}

void *VBArrayGetFirstObject(VBArray *array) {
    VBReturnValueMacro(array, NULL);
    
    return VBArrayGetObjectAtIndex(array, 0);
}

void *VBArrayGetLastObject(VBArray *array) {
    VBReturnValueMacro(array, NULL);
    
    return VBArrayGetObjectAtIndex(array, VBArrayGetCount(array) - 1);
}

void VBArraySetCapacity(VBArray *array, uint64_t capacity) {
    VBReturnMacro(array);
    
    if (array->_capacity == capacity) {
        return;
    }
    
    uint64_t count = VBArrayGetCount(array);
    size_t size = sizeof(void *);
    
    if (array->_capacity < capacity) {
        VBArraySetData(array, realloc(VBArrayGetData(array), capacity * size));
        memset(&array->_arrayData[count], 0, (capacity - count) * size);
    }
    
    VBAssignMacro(array->_capacity, capacity);
}

#pragma mark - 
#pragma mark Private

bool VBArrayNeedChangeSize(VBArray *array) {
    uint64_t count = VBArrayGetCount(array);
    uint64_t capacity = VBArrayGetCapacity(array);
    
    return count == capacity || count + kVBArrayStockValue < capacity * kVBArrayDecreaseValue;
}

bool VBArrayContainsObject(VBArray *array, void *object) {
    return VBArrayGetIndexOfObject(array, object) != kVBUndefindeIndex;
}

uint64_t VBArrayProvideSize(VBArray *array) {
    VBReturnValueMacro(array,kVBUndefindeIndex);
    
    uint64_t count = VBArrayGetCount(array);
    uint64_t capacity = VBArrayGetCapacity(array);
    
    if (count == capacity) {
            capacity = (capacity + kVBArrayStockValue) * kVBArrayIncreaseValue;
        } else {
            capacity = capacity * kVBArrayDecreaseValue;
        }
    
    return capacity;
}

void VBArrayChangeSizeIfNeeded(VBArray *array) {
    VBReturnMacro(array);
    if (VBArrayNeedChangeSize(array)) {
        VBArraySetCapacity(array, VBArrayProvideSize(array));
    }
}

uint64_t VBArrayGetIndexOfObject(VBArray *array, void *object) {
    VBReturnValueMacro(object, kVBUndefindeIndex);
    
    for (int index = 0; index <= VBArrayGetCount(array); index++) {
        if (VBArrayGetObjectAtIndex(array, index) == object) {
            return index;
        }
    }
    
    return kVBUndefindeIndex;
}

void VBArrayShiftFromIndex(VBArray *array, uint64_t index) {
    VBReturnMacro(array);
    
    void *firstObject = VBArrayGetObjectAtIndex(array, index);
    void *secondObject = VBArrayGetObjectAtIndex(array, index + 1);
    
    for (; index < VBArrayGetCount(array); index++) {
        if (firstObject == NULL) {
            VBArraySetObjectAtIndex(array, secondObject, index);
            VBArraySetObjectAtIndex(array, NULL, index + 1);
        }
    }
}

void VBArrayAddObjectAtIndex(VBArray *array, void *object, int64_t index) {
    VBReturnMacro(array);

    VBArrayChangeSizeIfNeeded(array);
    VBArraySetCount(array, VBArrayGetCount(array) + 1);
    VBArraySetObjectAtIndex(array, object, index);
}

void VBArrayRemoveObjectAtIndex(VBArray *array, uint64_t index) {
    VBReturnMacro(array);
    
    if (VBArrayGetObjectAtIndex(array, index) != NULL) {
        VBArraySetObjectAtIndex(array, NULL, index);
        VBArrayShiftFromIndex(array, index);
        VBArraySetCount(array, VBArrayGetCount(array) - 1);
        VBArrayChangeSizeIfNeeded(array);
    }
}

#pragma mark-
#pragma mark Public Implementations

void VBArrayRemoveObject(VBArray *array, void *object) {
    VBReturnMacro(array);
    
    uint64_t index = VBArrayGetIndexOfObject(array, object);
    VBArrayRemoveObjectAtIndex(array, index);
}

void VBArrayRemoveAllObjects(VBArray *array) {
    VBReturnMacro(array);
    
    for (int64_t index = VBArrayGetCount(array); index >= 0; index--) {
        VBArrayRemoveObjectAtIndex(array, index);
    }
}

void VBArrayAddObject(VBArray *array, void *object) {
    VBReturnMacro(array);
    
    uint64_t index = VBArrayGetCount(array);
    VBArrayAddObjectAtIndex(array, object, index);
}

