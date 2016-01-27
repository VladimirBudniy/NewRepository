//
//  VBString.h
//  C project
//
//  Created by Vladimir Budniy on 22.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBString_h
#define VBString_h

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#include "VBObject.h"

typedef struct VBString VBString;

struct VBString {
    VBObject _super;
    char *_name;
    uint16_t _symbolsCount;
};

extern
VBString *VBStringCreateWithData(char *string);

extern
char *VBStringGetData(VBString *string);

extern
void VBStringPrintString(VBString *stringName);

extern
uint16_t VBStringGetSymbolsCount(VBString *stringName);

extern
VBString *VBStringWithString(VBString *firstString, VBString *secondString);

extern
bool VBStringIsEqual(VBString *firstName, VBString *secondName);

extern
bool VBStringIsEmpty(VBString *string);

#endif /* VBString_h */
