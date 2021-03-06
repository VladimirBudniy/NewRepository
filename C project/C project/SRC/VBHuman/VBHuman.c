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
#include "VBArray.h"

struct VBHuman {
    VBObject _super;
    VBHuman *_partner;
    VBHuman *_father;
    VBHuman *_mother;
    VBArray *_childrenArray;
    VBHumanGenderType _gender;
    VBString *_string;
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
void VBHumanSetName(VBHuman *human, VBString *string);

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
void VBHumanSetChildren(VBHuman *human, VBArray *array);

static
VBArray *VBHumanGetChildren(VBHuman *human);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBHumanDeallocate(void *human) {
    VBHumanSetName(human, NULL);
    VBHumanDivorce(human);
    VBHumanSetPartner(human, NULL);
    VBHumanSetFather(human, NULL);
    VBHumanSetMother(human, NULL);
    VBHumanRemoveAllChildren(human);
    VBHumanSetChildren(human, NULL);
    
    __VBObjectDeallocate(human);
}

VBHuman *VBHumanCreateChildWithNameGenderParents(VBString *string,
                                                 VBHumanGenderType gender,
                                                 VBHuman *father,
                                                 VBHuman *mother)
    {
    VBHuman *child = VBHumanCreateWithNameGender(string, gender);
    VBHumanSetFather(child, father);
    VBHumanSetMother(child, mother);
    if (VBHumanGetPartner(father) == mother) { // переделать по полу
        VBHumanAddChild(father, child);
        VBHumanAddChild(mother, child);
    }

    return child;
}

VBHuman *VBHumanCreateWithNameGender(VBString *string, VBHumanGenderType gender) {
    VBHuman *human = __VBHumanCreate();
    VBHumanSetName(human, string);
    VBHumanSetGender(human, gender);
    
    return human;
}

VBHuman *__VBHumanCreate(void) {
    VBHuman *human = VBObjectCreate(VBHuman);
    VBArray *array = VBArrayCreate();
    VBHumanSetChildren(human, array);
    VBObjectRelease(array);
    
    return human;
}

#pragma mark-
#pragma mark Accessors

void VBHumanSetChildren(VBHuman *human, VBArray *array) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_childrenArray, array);
}

VBArray *VBHumanGetChildren(VBHuman *human) {
    return human->_childrenArray;
}

void VBHumanSetName(VBHuman *human, VBString *string) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_string, string);
    
}

void *VBHumanGetName(VBHuman *human) {
    VBReturnValueMacro(human, NULL);
    
    return human->_string;
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
    VBReturnValueMacro(human, 0);
    
    return human->_age;
}

void VBHumanSetChild(VBHuman *human, uint8_t child) {
    VBReturnMacro(human);
    human->_child = child;
}

uint8_t VBHumanGetChild(VBHuman *human) {
    VBReturnValueMacro(human, 0);
    
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
    VBReturnValueMacro(human, NULL);

    return human->_partner;
}

bool VBHumanGetIsMarried(VBHuman *human) {
    VBReturnValueMacro(human, NULL);
    
    return VBHumanGetPartner(human) ? true : false;
}

void VBHumanSetMother(VBHuman *human, VBHuman *mother) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_mother, mother);
}

VBHuman *VBHumanGetMother(VBHuman *human) {
    VBReturnValueMacro(human, NULL);

    return human->_mother;
}

void VBHumanSetFather(VBHuman *human, VBHuman *father) {
    VBReturnMacro(human);
    
    VBRetainMacro(human->_father, father);
}

VBHuman *VBHumanGetFather(VBHuman *human) {
    VBReturnValueMacro(human, NULL);
    
    return human->_father;
}

#pragma mark-
#pragma mark Public Implementations

void VBHumanAddChild(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    VBArrayAddObject(VBHumanGetChildren(human), child);
}

VBHuman *VBHumanGetChildAtIndex(VBHuman *human, uint16_t index) {
    VBReturnValueMacro(human, NULL);
    
    return VBArrayGetObjectAtIndex(VBHumanGetChildren(human), index);
}

void VBHumanRemoveChild(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    VBHumanGetGender(human) == kVBHumanMaleGenderType
        ? VBHumanSetFather(child, NULL)
        : VBHumanSetMother(child, NULL);
    
    VBArrayRemoveObject(VBHumanGetChildren(human), child);
}

void VBHumanRemoveAllChildren(VBHuman *human) {
    VBReturnMacro(human);
    
    VBArray *array = VBHumanGetChildren(human);
    for (uint64_t index = VBArrayGetCount(array); index > 0; index--) {
        VBHuman *child = VBHumanGetChildAtIndex(human, index);
        VBHumanRemoveChild(human, child);
    }
}

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

