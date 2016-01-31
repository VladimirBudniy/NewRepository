
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
#include "VBArray.h"
#include "VBDynamicArray.h"

void VBPrintHumanTests(void) {
//
//    VBHuman *human = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHumanSetAge(human, 23);
//    VBHumanSetChild(human, 3);
//    
//    VBHuman *partner = VBHumanCreateWithNameGender(VBStringCreateWithData("Elsa"), kVBHumanFemaleGenderType);
//    VBHumanSetAge(partner, 20);
//    VBHumanSetChild(partner, 3);
//
//    VBHumanMarry(human, partner);
//    
//    VBHuman *child = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Vasia"), kVBHumanMaleGenderType, human, partner);
//    VBHuman *child2 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Masia"), kVBHumanFemaleGenderType, human, partner);
//    VBHuman *child3 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Petya"), kVBHumanMaleGenderType, human, partner);
//    VBHuman *child4 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Katya"), kVBHumanFemaleGenderType, human, partner);
//    VBHuman *child5 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Katya"), kVBHumanFemaleGenderType, human, partner);
//    VBHuman *child6 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Katya"), kVBHumanFemaleGenderType, human, partner);
//    
//    VBHumanRemoveChild(human, child3);
//    VBHumanRemoveChild(human, child2);
//    VBHumanRemoveChild(human, child4);
//    VBHumanRemoveChild(human, child);
//
//    
//    VBHumanRemoveAllChildren(human);
//    VBHumanRemoveAllChildren(partner);
//
//    VBHumanDivorce(human);
//    
//    VBObjectRelease(human);
//    VBObjectRelease(partner);
//    
//    VBHuman *human1 = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHuman *human2= VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHuman *human3 = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHuman *human4 = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHuman *human5 = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    VBHuman *human6 = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
//    
//    VBArray *array = VBArrayCreate();
//    
//    VBArrayAddObject(array, human);
//    VBArrayAddObject(array, human1);
//    VBArrayAddObject(array, human2);
//    VBArrayAddObject(array, human3);
//    VBArrayAddObject(array, human4);
//    VBArrayAddObject(array, human5);
//    VBArrayAddObject(array, human6);
//    VBArrayAddObject(array, partner);
//    
//    VBArrayRemoveObject(array, human4);
//
//    VBArrayRemoveAllElements(array);
//    
//    printf("%d ", VBObjectGetRetaineCount(human));
    
    int *array = VBArrayCreateDynamicArray();
    printf("%lu \n", sizeof(array));
    
    

}