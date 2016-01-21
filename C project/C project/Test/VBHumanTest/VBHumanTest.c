
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

//#include <stdbool.h>

void VBPrintHumanTests(void) {
    
    VBPrintNextString;
    VBHuman *human = VBHumanCreateWithNameGender("Bob", kVBHumanMaleGenderType);
    VBHumanSetAge(human, 23);
    VBHumanSetChild(human, 3);
    
    VBHuman *partner = VBHumanCreateWithNameGender("Elsa", kVBHumanFemaleGenderType);
    VBHumanSetAge(partner, 20);
    VBHumanSetChild(partner, 3);
    
    VBHumanMarry(human, partner); // retaine count not calculate
    
    VBObjectRelease(human);
    
    puts(VBHumanGetName(human));
    
    VBHuman *mother = VBHumanCreateWithNameGender("Emma", kVBHumanFemaleGenderType);
    VBHumanSetAge(mother, 40);
    VBHumanSetChild(mother, 1);
    
    VBHuman *father = VBHumanCreateWithNameGender("Bruce", kVBHumanMaleGenderType);
    VBHumanSetAge(father, 43);
    VBHumanSetChild(father, 3);
    
    VBHumanMarry(father, mother); // retaine count not calculate
    
    VBHuman *child = VBHumanCreateChildWithNameGenderParents("Vasya", kVBHumanMaleGenderType, human, partner);
    VBHuman *child1 = VBHumanCreateWithNameGender("Piter", kVBHumanMaleGenderType);
    VBHuman *child2 = VBHumanCreateWithNameGender("Letty", kVBHumanFemaleGenderType);
    
    VBHumanAddChild(human, child1);
    VBHumanAddChild(human, child2);
    
    VBHumanRemoveChild(human, child1);
    VBHumanRemoveChildAtIndex(human, 2);
    VBHumanRemoveAllChildren(human);
    VBHumanRemoveAllChildren(partner);
    
    VBHumanDivorce(father);
    VBHumanDivorce(human);

    VBObjectRelease(mother);
    VBObjectRelease(father);
    VBObjectRelease(partner);
    VBObjectRelease(child1);
    VBObjectRelease(child2);
    VBObjectRelease(child);

    puts(VBHumanGetName(mother));
}