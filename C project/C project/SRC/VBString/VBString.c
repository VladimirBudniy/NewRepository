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
void __VBStringDeallocate(VBString *string);

static
VBString *VBStringCreate(void);

static
void VBStringSetData(VBString *string, char *data);

static
void VBStringSetSymbolsCount(VBString *string, uint16_t count);


#pragma mark-
#pragma mark Initialization & Deallocation

void __VBStringDeallocate(VBString *string) {
    VBStringSetData(string, NULL);
    
    __VBObjectDeallocate(string);
}

VBString *VBStringCreate(void) {
    VBString *string = VBObjectCreate(VBString);
    
    return  string;
}

VBString *VBStringCreateWithData(char *data) {
    VBString *string = VBStringCreate();
    VBStringSetData(string, data);
    
    return string;
}

#pragma mark-
#pragma mark Accessors

void VBStringSetData(VBString *string, char *data) {
    VBReturnMacro(string);

    if (!VBStringIsEmpty(string)) {
        free(string->_name);
    }
    
    if (data) {
        string->_name = strdup(data);
    } else {
        string->_name = NULL;
    }
    
    VBStringSetSymbolsCount(string, strlen(VBStringGetData(string)));
}

char *VBStringGetData(VBString *string) {
    VBReturnValueMacro(string, NULL);

    return string->_name;
}

void VBStringSetSymbolsCount(VBString *string, uint16_t count) {
    VBReturnMacro(string);
    
    string->_symbolsCount = count;
}

uint16_t VBStringGetSymbolsCount(VBString *string) {
    VBReturnValueMacro(string, 0);
    
    return string->_symbolsCount;
}

#pragma mark -
#pragma mark Private

bool VBStringIsEmpty(VBString *string) {
    VBReturnValueMacro(string, NULL);
    
    return 0 == VBStringGetSymbolsCount(string);
}

bool VBStringIsEqual(VBString *firstString, VBString *secondString) {
    VBReturnValueMacro(firstString, 0);
    VBReturnValueMacro(secondString, 0);
    
    if (0 == strcmp(VBStringGetData(firstString), VBStringGetData(secondString))) {
        return true;
    }
    
    return false;
}

#pragma mark-
#pragma mark Public Implementations

void VBStringPrintString(VBString *string) {
    VBReturnMacro(string);
    
    if (0 == VBStringGetSymbolsCount(string)) {
        puts("ERROR");
    } else {
        puts(VBStringGetData(string));
    }
}

VBString *VBStringWithString(VBString *firstString, VBString *secondString) {
    VBReturnValueMacro(firstString, 0);
    
    if (VBStringIsEmpty(secondString)) {
        return firstString;
    }
    
    uint16_t count = VBStringGetSymbolsCount(firstString) + VBStringGetSymbolsCount(secondString);
    
    char *charString = calloc(count, sizeof(char));
    charString = VBStringGetData(firstString);
    
    char *spacebar = " ";
    
    strcat(charString, spacebar);
    strcat(charString, VBStringGetData(secondString));
    
    VBString *string = VBStringCreateWithData(charString);
    
    return string;
}
