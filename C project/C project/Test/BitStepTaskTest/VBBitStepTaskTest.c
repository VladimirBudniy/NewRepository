//
//  VBBitStepTaskTest.c
//  C project
//
//  Created by Vladimir Budniy on 04.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBBitStepTaskTest.h"
#include "VBBitStepTask.h"
#include "VBMacroHeader.h"

void VBPrintBitStepTest(void) {
    
    int firstTestValue = 16;
    VBPrintBitValueShift(&firstTestValue, sizeof(firstTestValue));
    
//    firstTestValue = 64;
//    VBPrintBitValueShift(&firstTestValue, sizeof(firstTestValue));
    
    firstTestValue = 16;
    VBPrinttValueBitStep(&firstTestValue, sizeof(firstTestValue));
    
//    firstTestValue = 64;
//    VBPrinttValueBitStep(&firstTestValue, sizeof(firstTestValue));
    
}

