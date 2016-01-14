
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
    
    VBHumanObject *child = VBHumanObjectCreateWithGenderNamed("Piter", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(child, 10);
    
    VBHumanObject *child2 = VBHumanObjectCreateWithGenderNamed("Letty", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(child2, 10);
    
    VBHumanObject *partner = VBHumanObjectCreateWithGenderNamed("Elsa", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(partner, 20);
    VBHumanObjectSetChild(partner, 2);
    
    VBHumanObject *mother = VBHumanObjectCreateWithGenderNamed("Emma", kVBHumanFemaleGenderType);
    VBHumanObjectSetAge(mother, 40);
    VBHumanObjectSetChild(mother, 2);
    
    VBHumanObject *father = VBHumanObjectCreateWithGenderNamed("Bruce", kVBHumanMaleGenderType);
    VBHumanObjectSetAge(father, 43);
    VBHumanObjectSetChild(father, 1);
    
    VBHumanObjectAddParent(human, father, mother);
    
    VBHumanObjectMarry(human, partner);
    VBHumanObjectMarry(father, mother);
    
    VBHumanObjectAddChild(human, child);
    VBHumanObjectAddChild(human, child2);
    


    puts(VBHumanObjectGetName(human));
//    puts((VBHumanObjectGetGender(human) == kVBHumanMaleGenderType) ? "Male" : "Female");
//    printf("The age is %d years\n", VBHumanObjectGetAge(human));
//    printf("He have %d children\n", VBHumanObjectGetChild(human));
//    puts(VBHumanObjectGetIsMarried(human) ? "Married" : "Unmarried");
//    
//
//    VBPrintNextString;
//    
//    puts(VBHumanObjectGetName(partner));
//    puts((VBHumanObjectGetGender(partner) == kVBHumanMaleGenderType) ? "Male" : "Female");
//    printf("The age is %d years\n", VBHumanObjectGetAge(partner));
//    printf("She have %d children\n", VBHumanObjectGetChild(partner));
//    puts(VBHumanObjectGetIsMarried(partner) ? "Married" : "Unmarried");
//    
//    VBPrintNextString;
//    
//    puts(VBHumanObjectGetName(father));
//    puts((VBHumanObjectGetGender(father) == kVBHumanMaleGenderType) ? "Male" : "Female");
//    printf("The age is %d years\n", VBHumanObjectGetAge(father));
//    printf("She have %d children\n", VBHumanObjectGetChild(father));
//    puts(VBHumanObjectGetIsMarried(father) ? "Married" : "Unmarried");
//    
//    VBPrintNextString;
//    
//    puts(VBHumanObjectGetName(mother));
//    puts((VBHumanObjectGetGender(mother) == kVBHumanMaleGenderType) ? "Male" : "Female");
//    printf("The age is %d years\n", VBHumanObjectGetAge(mother));
//    printf("She have %d children\n", VBHumanObjectGetChild(mother));
//    puts(VBHumanObjectGetIsMarried(mother) ? "Married" : "Unmarried");
    
}