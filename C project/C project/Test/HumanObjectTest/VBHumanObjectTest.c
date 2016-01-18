
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



void VBPrintHumanTests(void){
    
    
    VBPrintNextString;
    VBHumanObject *human = VBHumanObjectCreateWithGenderNamed("Bob", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetChild(human, 3);
    
    VBHumanObject *child1 = VBHumanObjectCreateWithGenderNamed("Piter", kVBHumanMaleGenderType);
    VBHumanObject *child2 = VBHumanObjectCreateWithGenderNamed("Letty", kVBHumanFemaleGenderType);
//    VBHumanObject *child3 = VBHumanObjectCreateWithGenderNamed("Sonya", kVBHumanFemaleGenderType);
//    VBHumanObject *child4 = VBHumanObjectCreateWithGenderNamed("Viktor", kVBHumanMaleGenderType);
//    VBHumanObject *child5 = VBHumanObjectCreateWithGenderNamed("Letty", kVBHumanFemaleGenderType);
//    VBHumanObject *child6 = VBHumanObjectCreateWithGenderNamed("Letty", kVBHumanFemaleGenderType);

    VBHumanObject *partner = VBHumanObjectCreateWithGenderNamed("Elsa", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(partner, 20);
    
    VBHumanObject *mother = VBHumanObjectCreateWithGenderNamed("Emma", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(mother, 40);
    
    VBHumanObject *father = VBHumanObjectCreateWithGenderNamed("Bruce", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(father, 43);

    VBHumanObjectAddParents(human, father, mother);
    
    VBHumanObjectMarry(human, partner);
    VBHumanObjectMarry(father, mother);
    
    VBHumanObjectBirthChild(human, partner, child1);
    VBHumanObjectBirthChild(human, partner, child2);
    
    VBHumanObjectRemoveChildrenIndex(human, child1);
    VBHumanObjectRemoveChildrenIndex(partner, child1);
    VBHumanObjectRemoveChildrenIndex(human, child2);
    VBHumanObjectRemoveChildrenIndex(partner, child2);
    
    VBHumanObjectDivorce(father);
    VBHumanObjectDivorce(human);

    VBHumanObjectRemoveFather(human, father);
    VBHumanObjectRemoveMother(human, mother);
    
    VBHumanObjectRelease(child1);
    VBHumanObjectRelease(child2);
    VBHumanObjectRelease(mother);
    VBHumanObjectRelease(father);
    VBHumanObjectRelease(partner);
    VBHumanObjectRelease(human);
    
    puts(VBHumanObjectGetName(human));
    puts(VBHumanObjectGetName(human));
    
   
    
}