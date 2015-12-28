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


//VBPrintValueType(int);
//не работает, нет связи со спецификатором


void VBPrintResult() {
    printf("%s ", "We are wait 20 - ");
    VBOutput_int(20);
    EnterLine;
    
    printf("%s ", "We are wait Y - ");
    VBOutput_char('Y');
    EnterLine;

    printf("%s ", "We are wait 3.14 - ");
    VBOutput_float(3.14);
    EnterLine;

}