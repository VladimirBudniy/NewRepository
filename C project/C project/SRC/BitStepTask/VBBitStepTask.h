//
//  VBBitStepTask.h
//  C project
//
//  Created by Vladimir Budniy on 04.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBBitStepTask_h
#define VBBitStepTask_h

#include <stdlib.h>
#include <stdbool.h>

#endif /* VBBitStepTask_h */

typedef union {
    bool boolCheckType : 1;
    char charValye;
} kVBCondition;

typedef enum {
    kVBUnknownType,
    kVBBigEndianType,
    kVBLittleEndianType,
} EndianType;

extern
void VBPrintBitField(void *valueBitField, size_t size);
