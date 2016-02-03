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

static const uint64_t kVBArryInitialCapacity = 5;

const uint64_t kVBUndefindeIndex = UINT64_MAX;

#pragma mark-
#pragma mark Private Declarations

static
void __VBArrayDeallocate(void *array);

static
void VBArrayShiftForIndex(VBArray *array, uint64_t index);

static
void VBArrayRemoveObjectAtIndex(VBArray *array, uint64_t index);

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
void VBArrayChangeSizeArrayIfNeeded(VBArray *array);


// добавить в bool параметр превышен шаг
// добавить метот изменения размера Resize он же и зануление пустых ячеек

// добавить метот Resize в сет капасити

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBArrayDeallocate(void *array) {
    VBArrayRemoveAllElements(array);
    
    __VBObjectDeallocate(array);
}

void *VBArrayCreate(void) {
    VBArray *array = VBObjectCreate(VBArray);
    VBArraySetCapacity(array, kVBArryInitialCapacity);
    VBArraySetCount(array, 0);
    
    return array;
}

#pragma mark-
#pragma mark Accessors


void VBArraySetCapacity(VBArray *array, uint64_t capacity) {
    
    VBReturnMacro(array);
    
    if (array->_capacity == capacity) {
        return;
    }
    
    uint64_t count = VBArrayGetCount(array);
    size_t size = sizeof(void *);
    
    if (array->_capacity < capacity) {
        void *pointer = realloc(VBArrayGetData(array), capacity * size);
        VBArraySetData(array, pointer);
        memset(&array->_arrayData[count], 0, (capacity - count) * size);
    }
    
    VBAssignMacro(array->_capacity, capacity);
}

uint64_t VBArrayGetCapacity(VBArray *array) {
    return array->_capacity;
}

void VBArraySetData(VBArray *array, void **data) {
    VBReturnMacro(array);
    
    VBAssignMacro(array->_arrayData, data);
}

void **VBArrayGetData(VBArray *array) {
    VBReturnNullMacro(array);
    
    return array->_arrayData;
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

void VBArrayAddObject(VBArray *array, void *object) { // добавить проверку и метот расширения массива resize
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
        VBArrayShiftForIndex(array, index);
        VBArraySetCount(array, VBArrayGetCount(array) - 1);
        VBArrayChangeSizeArrayIfNeeded(array);
    
    }
}

void VBArrayRemoveObject(VBArray *array, void *object) {

    VBReturnMacro(array);
    
    uint64_t index = VBArrayGetIndexOfObject(array, object);
    VBArrayRemoveObjectAtIndex(array, index);
    VBArrayShiftForIndex(array, index);
}

void VBArrayRemoveAllElements(VBArray *array) {
    VBReturnMacro(array);
    
    for (int index = VBArrayGetCount(array); index >= 0; index--) {
        VBArrayRemoveObjectAtIndex(array, index);
    }
}

void VBArrayAddObjectAtIndex(VBArray *array, void *object, int64_t index) { // remove after tests
    VBReturnMacro(array);
    
    VBArraySetCount(array, VBArrayGetCount(array) + 1);
    VBArrayChangeSizeArrayIfNeeded(array);
    VBArraySetObjectAtIndex(array, object, index);
    
}

#pragma mark - 
#pragma mark Private

bool VBArrayNeedChangeSize(VBArray *array) {
    uint64_t count = VBArrayGetCount(array);
    uint64_t capacity = VBArrayGetCapacity(array);
    
    if (count == capacity || count * 2 <= capacity) {
        return true;
    }
    
    return false;
}

void VBArrayChangeSizeArrayIfNeeded(VBArray *array) {
    VBReturnMacro(array);
    
    uint64_t count = VBArrayGetCount(array);
    uint64_t capacity = VBArrayGetCapacity(array);
    
    if (VBArrayNeedChangeSize(array)) {
        if ( count >= capacity) {
            VBArraySetCapacity(array, (capacity + count));
        } else {
            VBArraySetCapacity(array, (capacity - (count / 2)));
        }
    }
}

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

void *VBArrayGetFirstObject(VBArray *array) {
    VBReturnNullMacro(array);
    
    return VBArrayGetObjectAtIndex(array, 0);
}

void *VBArrayGetLastObject(VBArray *array) {
    VBReturnNullMacro(array);
    
    return VBArrayGetObjectAtIndex(array, VBArrayGetCount(array) - 1);
}

