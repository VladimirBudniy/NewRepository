//
//  VBFirstMacroTaskTest.c
//  VBMacroTask
//
//  Created by Vladimir Budniy on 27.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include "VBPrintTypeSizeTest.h"
#include "VBMacroHeader.h"

#include <stdio.h>

// Task 1.1

void VBPrintSizeTypeTest() {
    printf("%s ", "Print size of char - ");
    VBTypeLength(SizeTypeChar);
    
    printf("%s ", "Print size of short - ");
    VBTypeLength(SizeTypeShort);
    
    printf("%s ", "Print size of int - ");
    VBTypeLength(SizeTypeInt);
    
    printf("%s ", "Print size of long - ");
    VBTypeLength(SizeTypeLong);
    
    printf("%s ", "Print size of double - ");
    VBTypeLength(double);
    VBPrintNextString;

}

// Task 1.2

void VBPrintCountMacroTest() {
    printf("%s ", "The sum of macro - ");
    int firstValue = 20;
    int secondValue = 40;
    VBFirstMacro(firstValue, secondValue);
    
    printf("%s ", "The sum of macro - ");
    int thirdValue = 40;
    int fourthValue = 20;
    VBFirstMacro(thirdValue, fourthValue);
    VBPrintNextString;

}