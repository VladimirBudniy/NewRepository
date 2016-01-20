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

#include "VBHumanObject.h"
#include "VBMacroHeader.h"
#include "VBObject.h"


#pragma mark-
#pragma mark Private Declarations




#pragma mark-
#pragma mark Initialization & Deallocation

void __VBObjectDeallocate(VBObject *object) {
    free(object);
}

void *__VBObjectCreate(size_t size) {
    VBObject *object = calloc(1, sizeof(size));
    assert(object);
    
    object->_retainCount = 1;
    
    return object;
}

#pragma mark-
#pragma mark Public

void VBObjectRelease(VBObject *object) {
    VBReturnMacro(object);
    
    object->_retainCount--;
    
    if (0 == object->_retainCount) {
        __VBObjectDeallocate(object);
    }
}

void *VBObjectRetain(VBObject *object) {
    VBReturnNullMacro(object);
    
    object->_retainCount++;
    
    return object;
}


