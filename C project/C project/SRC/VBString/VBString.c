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
void __VBStringDeallocate(void *string);

static
VBString *VBStringCreate(void);

static
void VBStringSetData(VBString *string, char *data);

static
void VBStringSetSymbolsCount(VBString *string);


#pragma mark-
#pragma mark Initialization & Deallocation

void __VBStringDeallocate(void *string) {
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
    
    VBStringSetSymbolsCount(string);
}

bool VBStringIsEmpty(VBString *string) {
    VBReturnValueMacro(false);

    return 0 == VBStringGetSymbolsCount(string);
}

char *VBStringGetData(VBString *string) {
    VBReturnNullMacro(string);

    return string->_name;
}

void VBStringSetSymbolsCount(VBString *string) {
    VBReturnMacro(string);
    
    uint16_t count = strlen(VBStringGetData(string));
    
    string->_symbolsCount = count;
}

uint16_t VBStringGetSymbolsCount(VBString *data) {
    VBReturnValueMacro(data);
    
    return data->_symbolsCount;
}

void VBStringPrintString(VBString *data) {
    VBReturnMacro(data);
    
    if (0 == VBStringGetSymbolsCount(data)) {
        puts("ERROR");
    } else {
        puts(VBStringGetData(data));
    }
}

bool VBStringIsEqual(VBString *firstString, VBString *secondString) {
    VBReturnValueMacro(firstString);
    VBReturnValueMacro(secondString);
    
    if (0 == strcmp(VBStringGetData(firstString), VBStringGetData(secondString))) {
        return true;
    }
    
    return false;
}

VBString *VBStringWithString(VBString *firstString, VBString *secondString) {
    VBReturnNullMacro(firstString);
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
