//
//  VBString.c
//  C project
//
//  Created by Vladimir Budniy on 22.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>

#include "VBMacroHeader.h"
#include "VBString.h"
#include "VBObject.h"


#pragma mark-
#pragma mark Private Declarations

static
VBString *VBStringCreate(void);

static
void VBStringSetName(void *string, char *stringName);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBStringDeallocate(void *string) {
    VBStringSetName(string, NULL);
    
    __VBObjectDeallocate(string);
}

VBString *VBStringCreate(void) {
    VBString *string = VBObjectCreate(VBString);
    
    return  string;
}

VBString *VBStringCreateWithName(char *stringName) {
    VBString *string = VBStringCreate();
    VBStringSetName(string, stringName);
    
    return string;
}

#pragma mark-
#pragma mark Accessors

void VBStringSetName(void *string, char *stringName) {
    VBReturnMacro(string);

    VBString *newString = string;
    free(newString->_name);
    
    if (stringName) {
        newString->_name = strdup(stringName);
    } else {
        newString->_name = NULL;
    }
    
    VBStringSetSymbolsCount(string, stringName);
    VBStringIsEmpty(string);
}

void VBStringIsEmpty(void *string) {
    VBReturnMacro(string);
    
    assert(VBStringGetSymbolsCount(string) != 0);
//    if (0 == VBStringGetSymbolsCount(string)) {
//        puts("!!!Error!!!");
//    }
    return;
}

char *VBStringGetName(VBString *string) {
    VBReturnNullMacro(string);

    return string->_name;
}

void VBStringSetSymbolsCount(VBString *string, char *stringName) {
    VBReturnMacro(stringName);
    
    uint16_t count = strlen(VBStringGetName(string));
    
    string->_symbolsCount = count;
}

uint16_t VBStringGetSymbolsCount(VBString *stringName) {
    VBReturnValueMacro(stringName);
    
    return stringName->_symbolsCount;
}

void VBStringPrintString(VBString *stringName) {
    VBReturnMacro(stringName);
    
    puts(VBStringGetName(stringName));
}

bool VBStringIsEqual(VBString *firstName, VBString *secondName) {
    VBReturnValueMacro(firstName);
    VBReturnValueMacro(secondName);
    
    if (0 == strcmp(VBStringGetName(firstName), VBStringGetName(secondName))) {
        return true;
    }
    
    return false;
}

VBString *VBStringWithString(VBString *firstString, VBString *secondString) {
    VBReturnNullMacro(firstString);
    if (secondString == 0) {
        return firstString;
    }
    
    uint16_t count = VBStringGetSymbolsCount(firstString) + VBStringGetSymbolsCount(secondString);
    
    char *charString = calloc(count, sizeof(char));
    charString = VBStringGetName(firstString);
    
    char *spacebar = " ";
    
    strcat(charString, spacebar);
    strcat(charString, VBStringGetName(secondString));
    
    VBString *newString = VBStringCreateWithName(charString);
    
    return newString;
}




