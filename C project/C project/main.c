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
//#include "FirstStructTest.h"
//#include "VBFirstStruct.h"
//#include "VBPrintTypeSizeTest.h"
//#include "VBPrintValueAccordingQualifierTest.h"
//#include "VBPrintValueTest.h"
//#include "VBBitStepTaskTest.h"

#include "VBHumanObject.h"

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
//    
//// Print Bit
//    VBPrintBitStepTest();

    VBHumanObject *human = _VBHumanObjectCreate();
//    VBHumanObjectSetName(human, "Test name");
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetSex(human, true);
    VBHumanObjectSetChild(human, 3);
    
    puts(VBHumanObjectGetName(human));

    

    
    VBPrintNextString;
    
    return 0;
}
