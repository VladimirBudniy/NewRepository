//
//  VBBitStepTaskTest.c
//  C project
//
//  Created by Vladimir Budniy on 04.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBBitStepTaskTest.h"

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

static const char valueBiteSize = 8;

void VBPrintBitValue(char *valueFirstPoint) {
    char valueFirst = *valueFirstPoint;
    for (int index = 0; index < valueBiteSize; index++) {
        char stepBitValue = valueFirst >> index;
        printf("%d", stepBitValue & 1);
    }
}

void VBPrintBitValueShift(void *valueFirstPoint, size_t size) {
    for (int index = 0; index < size; index++) {
        char byte = ((char *)valueFirstPoint)[index];
        VBPrintBitValue(&byte);
        printf(" ");
    }
}