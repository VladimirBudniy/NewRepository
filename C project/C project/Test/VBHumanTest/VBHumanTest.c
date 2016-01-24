
//  VBHumanTest.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBHumanTest.h"
#include "VBHuman.h"
#include "VBMacroHeader.h"

#include "VBObject.h"
#include "VBString.h"

//#include <stdbool.h>

void VBPrintHumanTests(void) {
    
    VBHuman *human = VBHumanCreateWithNameGender("Bob", kVBHumanMaleGenderType);
    VBHumanSetAge(human, 23);
    VBHumanSetChild(human, 3);
    
    VBHuman *partner = VBHumanCreateWithNameGender("Elsa", kVBHumanFemaleGenderType);
    VBHumanSetAge(partner, 20);
    VBHumanSetChild(partner, 3);
    
    VBHumanMarry(human, partner);

//    VBHuman *child = VBHumanCreateChildWithNameGenderParents("Vasya", kVBHumanMaleGenderType, human, partner);
//    VBHumanRemoveAllChildren(human);
//    VBHumanRemoveAllChildren(partner);
//    
    VBHumanDivorce(human);
//
    VBObjectRelease(human);
//    VBObjectRelease(partner);
//    VBObjectRelease(child);
//    
//    printf("The retaincount Father %d,\n", VBObjectGetRetaineCount(human));
//    printf("The retaincount Mother  %d,\n", VBObjectGetRetaineCount(partner));
//    printf("The retaincount Child %d,\n", VBObjectGetRetaineCount(child));
    
//
    puts(VBStringGetName(human));
//    puts(VBHumanGetName(partner));
//    puts(VBHumanGetName(child));
//    
//    puts(VBHumanGetName(human));
}