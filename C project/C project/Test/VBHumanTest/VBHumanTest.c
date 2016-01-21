
//  VBHumanTest.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBHumanTest.h"
#include "VBHuman.h"
#include "VBMacroHeader.h"

//#include <stdbool.h>



void VBPrintHumanTests(void) {
    
    VBPrintNextString;
    VBHuman *human = VBHumanCreateWithNameGender("Bob", kVBHumanMaleGenderType);
    VBHumanSetAge(human, 23);
    VBHumanSetChild(human, 3);
    
    VBHuman *partner = VBHumanCreateWithNameGender("Elsa", kVBHumanFemaleGenderType);
    VBHumanSetAge(partner, 20);
    VBHumanSetChild(partner, 3);
    
    VBHuman *mother = VBHumanCreateWithNameGender("Emma", kVBHumanFemaleGenderType);
    VBHumanSetAge(mother, 40);
    VBHumanSetChild(mother, 1);
    
    VBHuman *father = VBHumanCreateWithNameGender("Bruce", kVBHumanMaleGenderType);
    VBHumanSetAge(father, 43);
    VBHumanSetChild(father, 3);
    
    VBHuman *child1 = VBHumanCreateWithNameGender("Piter", kVBHumanMaleGenderType);
    VBHuman *child2 = VBHumanCreateWithNameGender("Letty", kVBHumanFemaleGenderType);
    
    VBHumanMarry(human, partner);
    VBHumanMarry(father, mother);
    
    VBHumanBirthChild(father, mother, human);
    VBHumanBirthChild(human, partner, child1);
    VBHumanBirthChild(human, partner, child2);
    
    VBHumanRemoveChildrenIndex(human, child1);
    VBHumanRemoveChildrenIndex(partner, child1);
    VBHumanRemoveChildrenIndex(human, child2);
    VBHumanRemoveChildrenIndex(partner, child2);
    VBHumanRemoveChildrenIndex(father, human);
    VBHumanRemoveChildrenIndex(mother, human);
    
    VBHumanDivorce(father);
    VBHumanDivorce(human);
    
    VBHumanRelease(child1);
    VBHumanRelease(child2);
    VBHumanRelease(mother);
    VBHumanRelease(father);
    VBHumanRelease(partner);
    VBHumanRelease(human);
    
    puts(VBHumanGetName(human));
    puts(VBHumanGetName(human));
}