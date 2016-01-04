//
//  VBBitStepTask.c
//  C project
//
//  Created by Vladimir Budniy on 04.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBBitStepTask.h"
#include "VBMacroHeader.h"

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#pragma mark -
#pragma mark Private Declaration

static
void VBPrintBitValue(int8_t *valueAdressFirst);

static
void VBPrintValueBit(int8_t *valueAdressSecond);

static const char kVBValueBiteSize = 8;

#pragma mark -
#pragma mark Private Implimentation

void VBPrintBitValue(int8_t *valueAdressFirst) {
    int8_t value = *valueAdressFirst;
    for (int8_t index = kVBValueBiteSize; index > 0; index--) {
        printf((value >> (index-1)) & 1 ? "1" : "0");
    }
}

void VBPrintValueBit(int8_t *valueAdressSecond) {
    int8_t value = *valueAdressSecond;
    for (int8_t index = 0; index < kVBValueBiteSize; index++) {
        printf((value >> index) & 1 ? "1" : "0");
    }
}

#pragma mark -
#pragma mark Public Implimentation

void VBPrintBitValueShift(void *valueBitField, size_t size) {
    int8_t *value = (int8_t *)valueBitField;
    size_t index = size; // объяснить еще раз....
    do {
        index--;
        VBPrintBitValue(&value[index]);
        printf(" ");
    } while (index > 0);
    VBPrintNextString;
}

void VBPrinttValueBitStep(void *valueAdress, size_t size) {
    int8_t *value = (int8_t *)valueAdress;
    for (size_t index = 0; index < size; index++) {
        VBPrintValueBit(value++);
        printf(" ");
    }
    VBPrintNextString;
}