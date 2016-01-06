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

static
void VBPrintBitValueShift(void *valueBitField, size_t size, EndianType type);

static
void VBPrintBitValue(int8_t *valueAdressFirst, EndianType type);

kVBCondition checkSystemType;

#pragma mark -
#pragma mark Private Implimentation

EndianType CheckEndianType(void) {
    checkSystemType.charValye = 1;
    if (checkSystemType.charValye & 1) {
        return kVBBigEndianType;
    } else {
        return kVBLittleEndianType;
    }
}

void VBPrintBitValue(int8_t *valueAdressFirst, EndianType type) {
    int8_t value = *valueAdressFirst;
    if (type == kVBBigEndianType) {
        for (int8_t index = 0; index < kVBValueBiteSize; index++) {
            printf((value >> (kVBValueBiteSize - index - 1)) & 1 ? "1" : "0");
        }
    } else if (type == kVBLittleEndianType) {
        for (int8_t index = 0; index < kVBValueBiteSize; index++) {
            printf((value >> index) & 1 ? "1" : "0");
        }
    }
}

#pragma mark -
#pragma mark Public Implimentation

void VBPrintBitValueShift(void *valueBitField, size_t size, EndianType type) {
    int8_t *value = (int8_t *)valueBitField;
    if (type == kVBBigEndianType) {
        for (size_t index = 0; index < size; index++) {
            VBPrintBitValue(&value[size - index - 1], type);
            printf(" ");
        }
    } else if (type == kVBLittleEndianType) {
        for (size_t index = 0; index < size; index++) {
            VBPrintBitValue(value++, type);
            printf(" ");
        }
    }
    printf("\n");
}

void VBPrintBitField(void *valueBitField, size_t size) {
    VBPrintBitValueShift(valueBitField, size, CheckEndianType());
}


