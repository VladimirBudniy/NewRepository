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

static const char kVBValueBiteSize = 8;

typedef enum {
    kVBUnknownType,
    kVBBigEndianType,
    kVBLittleEndianType,
} VBEndianType;

static
void VBPrintBitValueShift(void *valueBitField, size_t size, VBEndianType type);

static
void VBPrintBitValue(int8_t *valueAdressFirst, VBEndianType type);

#pragma mark -
#pragma mark Private Implimentation

VBEndianType CheckEndianType(void) {
    int8_t charValue = 1;
    if (charValue & 1) {
        return kVBBigEndianType;
    } else if (charValue & 0) {
        return kVBLittleEndianType;
    }
    
    return kVBUnknownType;
}
    
void VBPrintBitValue(int8_t *valueAdressFirst, VBEndianType type) {
    int8_t value = *valueAdressFirst;
    for (int8_t increment = 0; increment < kVBValueBiteSize; increment++) {
        int8_t index = (type == kVBBigEndianType) ? (kVBValueBiteSize - increment - 1) : (increment);
            printf((value >> index) & 1 ? "1" : "0");
    }
}

#pragma mark -
#pragma mark Public Implimentation

void VBPrintBitValueShift(void *valueBitField, size_t size, VBEndianType type) {
    if (type == kVBUnknownType) {
        return;
    }
    
    int8_t *value = (int8_t *)valueBitField;
    for (size_t increment = 0; increment < size; increment++) {
        int8_t index = (type == kVBBigEndianType) ? (size - increment - 1) : (increment);
        VBPrintBitValue(&value[index], type);
            printf(" ");
    }
}

void VBPrintBitField(void *valueBitField, size_t size) {
    VBPrintBitValueShift(valueBitField, size, CheckEndianType());
    printf("\n");
}