//
//  main.c
//  C project
//
//  Created by Vladimir Budniy on 29.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

#include "VBMacroHeader.h"
#include "FirstStructTest.h"
#include "VBFirstStruct.h"
#include "VBPrintTypeSizeTest.h"
#include "VBPrintValueAccordingQualifierTest.h"
#include "VBPrintValueTest.h"
#include "VBBitStepTaskTest.h"

int main(int argc, const char * argv[]) {
////  Macro Task
//    
//    printf("%s\n", "Task 1");
//    VBPrintSizeTypeTest();
//    VBPrintCountMacroTest();
//    
//    printf("\n%s\n", "Task 2");
//    VBPrintValueAccordingQualifierTest();
//    
//    printf("\n%s\n", "Task 3");
//    VBPrintResult();
//    
////    Struct Task
//    
//    VBPrintSequenceNumber();
//    VBPrintSizeStruct();
//    VBPrintSizeType();
    
// Print Bit
    char charTestValue = 1;
    VBPrintBitValue(&charTestValue);
    VBPrintNextString;
    
    charTestValue = 2;
    VBPrintBitValue(&charTestValue);
    VBPrintNextString;
    
    charTestValue = 4;
    VBPrintBitValue(&charTestValue);
    VBPrintNextString;
    
    charTestValue = UINT64_MAX;
    VBPrintBitValue(&charTestValue);
    VBPrintNextString;
    
    
    int firstTestValue = 16;
    VBPrintBitValueShift(&firstTestValue, sizeof(firstTestValue));
    VBPrintNextString;
    
    float secondTestValue = 17.7;
    VBPrintBitValueShift(&secondTestValue, sizeof(secondTestValue));
    VBPrintNextString;
    
    return 0;
}
