
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

    VBHuman *human = VBHumanCreateWithNameGender(VBStringCreateWithData("Bob"), kVBHumanMaleGenderType);
    VBHumanSetAge(human, 23);
    VBHumanSetChild(human, 3);
    
    VBHuman *partner = VBHumanCreateWithNameGender(VBStringCreateWithData("Elsa"), kVBHumanFemaleGenderType);
    VBHumanSetAge(partner, 20);
    VBHumanSetChild(partner, 3);
    
    VBHumanMarry(human, partner);
    
    VBHuman *child = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Vasia"), kVBHumanMaleGenderType, human, partner);
    VBHuman *child2 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Masia"), kVBHumanFemaleGenderType, human, partner);
    VBHuman *child3 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Petya"), kVBHumanMaleGenderType, human, partner);
    VBHuman *child4 = VBHumanCreateChildWithNameGenderParents(VBStringCreateWithData("Katya"), kVBHumanFemaleGenderType, human, partner);
    
    VBHumanRemoveChild(human, child3);
    VBHumanRemoveChild(human, child2);
    
    VBHumanRemoveAllChildren(human);
    VBHumanRemoveAllChildren(partner);

    VBHumanDivorce(human);
    
    VBObjectRelease(human);
    VBObjectRelease(partner);

}