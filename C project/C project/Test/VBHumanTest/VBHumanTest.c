
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
    
    VBString *womanName = VBStringCreateWithData("Elsa");
    VBString *childName =  VBStringCreateWithData("Vasia");
    VBString *manName = VBStringCreateWithData("");
    
    VBStringPrintString(manName);
    VBStringPrintString(womanName);
    VBStringPrintString(childName);

    VBHuman *human = VBHumanCreateWithNameGender(manName, kVBHumanMaleGenderType);
    VBHumanSetAge(human, 23);
    VBHumanSetChild(human, 3);
    
    VBHuman *partner = VBHumanCreateWithNameGender(womanName, kVBHumanFemaleGenderType);
    VBHumanSetAge(partner, 20);
    VBHumanSetChild(partner, 3);
    
    VBHumanMarry(human, partner);
    
    VBHuman *child = VBHumanCreateWithNameGender(childName, kVBHumanMaleGenderType);
    
    VBHumanAddChild(human, child);
    
    VBHumanRemoveAllChildren(human);
    VBHumanRemoveAllChildren(partner);

    VBHumanDivorce(human);

    VBObjectRelease(human);
    VBObjectRelease(partner);
    VBObjectRelease(child);

}