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
    
    
    VBPrintNextString;
    
    VBHumanObject *human = VBHumanObjectCreateWithGenderNamed("Bob", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetChild(human, 3);
    
    VBHumanObject *partner = VBHumanObjectCreateWithGenderNamed("Elsa", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(partner, 20);
    VBHumanObjectSetChild(partner, 2);
    
    VBHumanObject *father = VBHumanObjectCreateWithGenderNamed("Bruce", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(father, 43);
    VBHumanObjectSetChild(father, 1);
    
    VBHumanObject *mother = VBHumanObjectCreateWithGenderNamed("Emma", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(mother, 40);
    VBHumanObjectSetChild(mother, 2);
    
    VBHUmanObjectSetParent(human, mother);
    VBHUmanObjectSetParent(human, father);
    
    VBHumanObjectMarry(human, partner);
    
    puts(VBHumanObjectGetName(human));
    VBHumanObjectGetGender(human);
    printf("The age is %d years\n", VBHumanObjectGetAge(human));
    printf("He have %d children\n", VBHumanObjectGetChild(human));
    puts(VBHumanObjectGetMarried(human) ? "Married" : "Unmarried");

    VBPrintNextString;
    
    puts(VBHumanObjectGetName(partner));
    VBHumanObjectGetGender(partner);
    printf("The age is %d years\n", VBHumanObjectGetAge(partner));
    printf("She have %d children\n", VBHumanObjectGetChild(partner));
    puts(VBHumanObjectGetMarried(partner) ? "Married" : "Unmarried");
}