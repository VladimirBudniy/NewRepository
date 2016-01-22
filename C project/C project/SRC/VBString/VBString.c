//
//  VBString.c
//  C project
//
//  Created by Vladimir Budniy on 22.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdlib.h>

#include "VBMacroHeader.h"
#include "VBString.h"
#include "VBObject.h"



#pragma mark-
#pragma mark Initialization & Deallocation

void __VBStringDeallocate(void *string) {
    VBStringSetName(string, NULL);
    
    __VBObjectDeallocate(string);
}

void *VBStringCreateWithName(void *name) {
    VBString *string = VBObjectCreate(VBString);
    VBStringSetName(string, name);
    
    return string;
}

void VBStringSetName(void *string, char *name) {
    VBReturnMacro(string);

    VBString *newString = string;
    free(newString->_name);
    
    if (name) {
        newString->_name = strdup(name);
    } else {
        newString->_name = NULL;
    }
}

void *VBStringGetName(void *string) {
    VBReturnNullMacro(string);
    
    VBString *newString = string;
    
    return newString->_name;
}