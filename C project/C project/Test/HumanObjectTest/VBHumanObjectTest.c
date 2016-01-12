//
//  VBHumanObjectTest.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBHumanObjectTest.h"
#include "VBHumanObject.h"
#include "VBMacroHeader.h"

#include <stdbool.h>



void VBPrintHumanTests(void){
    VBHumanObject *humanWithName = VBHumanObjectCreateWithName("Created with name");
    puts(VBHumanObjectGetName(humanWithName));
    VBPrintNextString;
    
    VBHumanObject *human = __VBHumanObjectCreate();
    VBHumanObjectSetName(human, "Bob");
    VBHumanObjectSetGender(human, kVBHumanMaleGenderType);
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetChild(human, 3);
    
    VBHumanObject *partner = __VBHumanObjectCreate();
    VBHumanObjectSetName(partner, "Elsa");
    VBHumanObjectSetGender(partner, kVBHUmanFemaleGenderType);
    VBHumanObjectSetAge(partner, 20);
    VBHumanObjectSetChild(partner, 2);
    
    VBHumanObjectMarry(human, partner);
    
    printf("The name is %s\n", VBHumanObjectGetName(human));
    VBHumanObjectGetGender(human);
    printf("The age is %d years\n", VBHumanObjectGetAge(human));
    printf("He have %d children\n", VBHumanObjectGetChild(human));
    puts(VBHumanObjectGetMarried(human) ? "Married" : "Unmarried");
    
    VBPrintNextString;
    
    printf("The name is %s\n", VBHumanObjectGetName(partner));
    VBHumanObjectGetGender(partner);
    printf("The age is %d years\n", VBHumanObjectGetAge(partner));
    printf("She have %d children\n", VBHumanObjectGetChild(partner));
    puts(VBHumanObjectGetMarried(partner) ? "Married" : "Unmarried");
    
}