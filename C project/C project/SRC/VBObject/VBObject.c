//
//  VBObject.c
//  C project
//
//  Created by Vladimir Budniy on 20.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

#include "VBHuman.h"
#include "VBMacroHeader.h"
#include "VBObject.h"


#pragma mark-
#pragma mark Initialization & Deallocation

void __VBObjectDeallocate(void *object) {
    free(object);
}

void *__VBObjectCreate(size_t type, VBObjectDeallocator *deallocator) {
    VBObject *object = calloc(1, sizeof(type));
    assert(object);
    
    object->_retainCount = 1;
    object->_deallocator = deallocator;
    
    return object;
}

#pragma mark-
#pragma mark Public

void *VBObjectRetain(void *object) {
    VBReturnNullMacro(object);
    
    VBObject *newObject = object;
    
    newObject->_retainCount++;
    
    return newObject;
}

void VBObjectRelease(void *object) {
    VBReturnMacro(object);
    
    VBObject *newObject = object;
    
    newObject->_retainCount--;
    
    if (0 == newObject->_retainCount) {
        __VBObjectDeallocate(newObject);
    }
}
