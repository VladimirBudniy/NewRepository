
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

void VBPrintHumanTests(void) {
//
//    VBHuman *human = VBHumanCreateWithNameGender(VBStringCreateWithData("firdt name"), kVBHumanMaleGenderType);
//    VBHuman *partner = VBHumanCreateWithNameGender(VBStringCreateWithData("second name"), kVBHumanFemaleGenderType);
//    VBHuman *child1 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child1"), kVBHumanFemaleGenderType);
//    VBHuman *child2 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child2"), kVBHumanFemaleGenderType);
//    VBHuman *child3 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child3"), kVBHumanFemaleGenderType);
//    VBHuman *child4 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child4"), kVBHumanFemaleGenderType);
//    VBHuman *child5 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child5"), kVBHumanFemaleGenderType);
//    VBHuman *child6 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child6"), kVBHumanFemaleGenderType);
//    VBHuman *child7 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child7"), kVBHumanFemaleGenderType);
//    VBHuman *child8 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child8"), kVBHumanFemaleGenderType);
//    VBHuman *child9 = VBHumanCreateWithNameGender(VBStringCreateWithData("Child9"), kVBHumanFemaleGenderType);
    VBString *string = VBStringCreateWithData("name");
    
    VBArray *array = VBArrayCreate();
    
//    VBArrayAddObject(array, human);
//    VBArrayAddObject(array, partner);
//    VBArrayAddObject(array, child1);
//    VBArrayAddObject(array, child2);
//    VBArrayAddObject(array, child3);
//    VBArrayAddObject(array, child4);
//    VBArrayAddObject(array, child5);
//    VBArrayAddObject(array, child6);
//    VBArrayAddObject(array, child7);
//    VBArrayAddObject(array, child8);
//    VBArrayAddObject(array, child9);
    
    for (int i = 0; i < 50; i++) {
        VBArrayAddObjectAtIndex(array, string, i);
    }
    
    VBArrayRemoveAllElements(array);
    
    VBArray *array1 = VBArrayCreate();

}