//
//  VBPrintValueTest.c
//  VBMacroTask
//
//  Created by Vladimir Budniy on 27.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include "VBMacroHeader.h"

#include <stdio.h>

VBPrintTypeValue(int, "%d");
VBPrintTypeValue(char, "%c");
VBPrintTypeValue(float, "%.2f");

void VBPrintResult() {
    printf("%s ", "We are wait 20 - ");
    VBPrintValueType(int, 5);
    VBPrintNextString;
    
    printf("%s ", "We are wait Y - ");
    VBPrintValueType(char, 'Y');
    VBPrintNextString

    printf("%s ", "We are wait 3.14 - ");
    VBPrintValueType(float, 3.14);
    VBPrintNextString;

}