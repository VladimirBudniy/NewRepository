
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


void VBPrintHumanTests(void) {
    
    VBString *womanName = VBStringCreateWithName("Elsa");
    VBString *childName =  VBStringCreateWithName("Vasia");
    VBString *manName = VBStringCreateWithName("");
    
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
    
    VBHuman *child = VBHumanCreateChildWithNameGenderParents(childName, kVBHumanMaleGenderType, human, partner);
    VBHumanRemoveAllChildren(human);
    VBHumanRemoveAllChildren(partner);

    VBHumanDivorce(human);

    VBObjectRelease(human);
    VBObjectRelease(partner);
    VBObjectRelease(child);

    puts(VBHumanGetName(human));
    puts(VBHumanGetName(human));
    
    puts(VBHumanGetName(partner));
    puts(VBHumanGetName(child));
}