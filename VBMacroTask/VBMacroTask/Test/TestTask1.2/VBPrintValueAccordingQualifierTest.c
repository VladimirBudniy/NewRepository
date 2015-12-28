//
//  VBPrintValueAccordingQualifierTest.c
//  VBMacroTask
//
//  Created by Vladimir Budniy on 27.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include "VBMacroHeader.h"
#include "VBPrintValueAccordingQualifierTest.h"

#include <stdio.h>

void VBPrintValueAccordingQualifierTest() {
    printf("%s ", "We are wait 20 - ");
    VBPrintValue("%d", 20);
    EnterLine;
    
    printf("%s ", "We are wait 4 - ");
    VBPrintValue("%lu", sizeof(int));
    EnterLine;
    
    printf("%s ", "We are wait A - ");
    VBPrintValue("%c", 'A');
    EnterLine;
}