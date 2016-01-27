//
//  VBHuman.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

#include "VBHuman.h"
#include "VBMacroHeader.h"
#include "VBObject.h"
#include "VBString.h"

static const uint16_t kVBChildrenCount = 5;

struct VBHuman {
    VBObject _super;
    VBHuman *_partner;
    VBHuman *_father;
    VBHuman *_mother;
    VBHuman *_children[kVBChildrenCount];
    VBHumanGenderType _gender;
    VBString *_nameString;
    uint16_t _age;
    uint16_t _child;
};

#pragma mark-
#pragma mark Private Declarations

static
void __VBHumanDeallocate(void *human);

static
VBHuman *__VBHumanCreate(void);

static
void VBHumanSetName(VBHuman *human, VBString *nameString);

static
void VBHumanSetPartner(VBHuman *human, VBHuman *partner);

static
void VBHumanSetGender(VBHuman *human, VBHumanGenderType sex);

static
VBHuman *VBHumanGetPartner(VBHuman *human);

static
void VBHumanSetMother(VBHuman *human, VBHuman *mother);

static
void VBHumanSetFather(VBHuman *human, VBHuman *father);

static
void VBHumanSetChildAtIndex(VBHuman *human, VBHuman *child, uint8_t index);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBHumanDeallocate(void *human) {
    VBHumanSetName(human, NULL);
    VBHumanDivorce(human);
    VBHumanSetPartner(human, NULL);
    VBHumanSetFather(human, NULL);
    VBHumanSetMother(human, NULL);
    VBHumanRemoveAllChildren(human);
    
    __VBObjectDeallocate(human);
}

VBHuman *VBHumanCreateChildWithNameGenderParents(VBString *nameString,
                                                 VBHumanGenderType gender,
                                                 VBHuman *father,
                                                 VBHuman *mother)
    {
    VBHuman *child = VBHumanCreateWithNameGender(nameString, gender);
    VBHumanSetFather(child, father);
    VBHumanSetMother(child, mother);
    if (VBHumanGetPartner(father) == mother) {
        VBHumanAddChild(father, child);
        VBHumanAddChild(mother, child);
    }

    return child;
}

VBHuman *VBHumanCreateWithNameGender(VBString *nameString, VBHumanGenderType gender) {
    VBHuman *human = __VBHumanCreate();
    VBHumanSetName(human, nameString);
    VBHumanSetGender(human, gender);
    
    return human;
}

VBHuman *__VBHumanCreate(void) {
    VBHuman *human = VBObjectCreate(VBHuman);
    
    return human;
}

#pragma mark-
#pragma mark Accessors

void VBHumanSetName(VBHuman *human, VBString *nameString) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_nameString, nameString);
    
}

void *VBHumanGetName(VBHuman *human) {
    VBReturnNullMacro(human);
    
    return human->_nameString;
}

void VBHumanSetGender(VBHuman *human, VBHumanGenderType gender) {
    VBReturnMacro(human);
    
    if (gender == kVBUndefindeGenderType) {
        return;
    }
    
    human->_gender = gender;
}

VBHumanGenderType VBHumanGetGender(VBHuman *human) {
    return human->_gender;
}

void VBHumanSetAge(VBHuman *human, uint8_t age) {
    VBReturnMacro(human);
    
    human->_age = age;
}

uint8_t VBHumanGetAge(VBHuman *human) {
    VBReturnValueMacro(human);
    
    return human->_age;
}

void VBHumanSetChild(VBHuman *human, uint8_t child) {
    VBReturnMacro(human);
    human->_child = child;
}

uint8_t VBHumanGetChild(VBHuman *human) {
    VBReturnValueMacro(human);
    
    return human->_child;
}

void VBHumanSetPartner(VBHuman *human, VBHuman *partner) {
    VBReturnMacro(human);
    
    VBHumanGenderType type = VBHumanGetGender(human);
    
    if (type == kVBHumanFemaleGenderType) {
        VBAssignMacro(human->_partner, partner);
    } else {
        VBRetainMacro(human->_partner, partner);
    }
}

VBHuman *VBHumanGetPartner(VBHuman *human) {
    VBReturnNullMacro(human);

    return human->_partner;
}

bool VBHumanGetIsMarried(VBHuman *human) {
    VBReturnNullMacro(human);
    
    return VBHumanGetPartner(human) ? true : false;
}

void VBHumanSetMother(VBHuman *human, VBHuman *mother) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_mother, mother);
}

VBHuman *VBHumanGetMother(VBHuman *human) {
    VBReturnNullMacro(human);

    return human->_mother;
}

void VBHumanSetFather(VBHuman *human, VBHuman *father) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_father, father);
}

VBHuman *VBHumanGetFather(VBHuman *human) {
    VBReturnNullMacro(human);
    
    return human->_father;
}

void VBHumanSetChildAtIndex(VBHuman *human, VBHuman *child, uint8_t index) {
    VBReturnMacro(human);
    
    if (VBHumanGetChildAtIndex(human, index) == NULL) {
        if (VBHumanGetGender(human) == kVBHumanMaleGenderType) {
            VBHumanSetFather(child, human);
        } else {
            VBHumanSetMother(child, human);
        }
    }

    VBAssignMacro(human->_children[index], child);
}

VBHuman *VBHumanGetChildAtIndex(VBHuman *human, uint8_t index) {
    VBReturnNullMacro(human);
    
    return human->_children[index];
}

#pragma mark-
#pragma mark Public Implementations

void VBHumanMarry(VBHuman *human, VBHuman *partner) {
    VBReturnMacro(human);
    
    if (VBHumanGetGender(human) == VBHumanGetGender(partner)) {
        return;
    }

    if ((VBHumanGetPartner(human) == NULL) && (VBHumanGetPartner(partner) == NULL)) {
        VBHumanSetPartner(human, partner);
        VBHumanSetPartner(partner, human);
    }
}

void VBHumanDivorce(VBHuman *human) {
    VBReturnMacro(human);
    
    VBHumanSetPartner(VBHumanGetPartner(human), NULL);
    VBHumanSetPartner(human, NULL);
}

void VBHumanAddChild(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    int index = 0;
    for (index = 0; VBHumanGetChildAtIndex(human, index) != NULL; index++) {
        if (index == (kVBChildrenCount - 1)) {
            return;
        }
    }
    
    VBHumanSetChildAtIndex(human, child, index);
}

void VBHumanRemoveChildAtIndex(VBHuman *human, uint8_t index) {
    VBReturnMacro(human);
    
    if (VBHumanGetChildAtIndex(human, index) != NULL) {
        VBHumanGetGender(human) == kVBHumanMaleGenderType
        ? VBHumanSetFather(VBHumanGetChildAtIndex(human, index), NULL)
        : VBHumanSetMother(VBHumanGetChildAtIndex(human, index), NULL);
        VBHumanSetChildAtIndex(human, NULL, index);
    }
}

void VBHumanRemoveChild(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    for (int index = 0; index < kVBChildrenCount; index++) {
        if (VBHumanGetChildAtIndex(human, index) == child) {
        VBHumanRemoveChildAtIndex(human, index);
        }
    }
}

void VBHumanRemoveAllChildren(VBHuman *human) {
    VBReturnMacro(human);
    
    for (int index = 0; index < kVBChildrenCount; index++) {
            VBHumanRemoveChildAtIndex(human, index);
    }
}

//#pragma mark -
//#pragma mark Public
//
//void VBHumanRetain(VBHuman *human) {
//    VBReturnMacro(human);
//    
//    human->_retainCount++;
//}
//
//void VBHumanRelease(VBHuman *human) {
//    VBReturnMacro(human);
//    
//    human->_retainCount--;
//    
//    if (0 == human->_retainCount) {
//        __VBHumanDeallocate(human);
//    }
//}
