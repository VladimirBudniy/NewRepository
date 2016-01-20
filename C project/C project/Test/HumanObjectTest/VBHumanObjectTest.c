
//  VBHumanObjectTest.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBHumanObjectTest.h"
#include "VBHumanObject.h"
#include "VBMacroHeader.h"

//#include <stdbool.h>



void VBPrintHumanTests(void) {
    
    VBPrintNextString;
    VBHumanObject *human = VBHumanObjectCreateWithNameGender("Bob", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetChild(human, 3);
    
    VBHumanObject *partner = VBHumanObjectCreateWithNameGender("Elsa", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(partner, 20);
    VBHumanObjectSetChild(partner, 3);
    
    VBHumanObject *mother = VBHumanObjectCreateWithNameGender("Emma", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(mother, 40);
    VBHumanObjectSetChild(mother, 1);
    
    VBHumanObject *father = VBHumanObjectCreateWithNameGender("Bruce", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(father, 43);
    VBHumanObjectSetChild(father, 3);
    
    VBHumanObject *child1 = VBHumanObjectCreateWithNameGender("Piter", kVBHumanMaleGenderType);
    VBHumanObject *child2 = VBHumanObjectCreateWithNameGender("Letty", kVBHumanFemaleGenderType);
//    VBHumanObject *child3 = VBHumanObjectCreateWithNameGender("Sonya", kVBHumanFemaleGenderType);
//    VBHumanObject *child4 = VBHumanObjectCreateWithNameGender("Viktor", kVBHumanMaleGenderType);
//    VBHumanObject *child5 = VBHumanObjectCreateWithNameGender("Letty", kVBHumanFemaleGenderType);
//    VBHumanObject *child6 = VBHumanObjectCreateWithNameGender("Letty", kVBHumanFemaleGenderType);
    
    VBHumanObjectMarry(human, partner);
    VBHumanObjectMarry(father, mother);
    
    VBHumanObjectBirthChild(father, mother, human);
    VBHumanObjectBirthChild(human, partner, child1);
    VBHumanObjectBirthChild(human, partner, child2);
    
    VBHumanObjectRemoveChildrenIndex(human, child1);
    VBHumanObjectRemoveChildrenIndex(partner, child1);
    VBHumanObjectRemoveChildrenIndex(human, child2);
    VBHumanObjectRemoveChildrenIndex(partner, child2);
    VBHumanObjectRemoveChildrenIndex(father, human);
    VBHumanObjectRemoveChildrenIndex(mother, human);
    
    VBHumanObjectDivorce(father);
    VBHumanObjectDivorce(human);
    
    VBHumanObjectRelease(child1);
    VBHumanObjectRelease(child2);
    VBHumanObjectRelease(mother);
    VBHumanObjectRelease(father);
    VBHumanObjectRelease(partner);
    VBHumanObjectRelease(human);
    
    puts(VBHumanObjectGetName(human));
    puts(VBHumanObjectGetName(human));
}