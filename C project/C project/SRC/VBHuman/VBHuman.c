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

static const uint16_t kVBChildrenCount = 5;

struct VBHuman {
    VBObject _super;
    VBHuman *_partner;
    VBHuman *_father;
    VBHuman *_mother;
    VBHuman *_children[kVBChildrenCount];
    VBHumanGenderType _gender;
    char *_name;
    uint16_t _age;
    uint16_t _child;
    uint16_t _retainCount;
};

#pragma mark-
#pragma mark Private Declarations

static
void __VBHumanDeallocate(VBHuman *human);

static
VBHuman *__VBHumanCreate(void);

static
void VBHumanSetName(VBHuman *human, char *name);

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

static
void VBHumanRemoveAllChildrenIndex(VBHuman *human);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBHumanDeallocate(VBHuman *human) {
    VBHumanSetName(human, NULL);
    VBHumanSetPartner(human, NULL);
    VBHumanSetFather(human, NULL);
    VBHumanSetMother(human, NULL);
    VBHumanRemoveAllChildrenIndex(human);
    
    free(human);
}

VBHuman *VBHumanCreateWithNameGender(char *name, VBHumanGenderType gender) {
    VBHuman *human = __VBHumanCreate();
    VBHumanSetName(human, name);
    VBHumanSetGender(human, gender);
    
    return human;
}

VBHuman *__VBHumanCreate(void) {
    VBHuman *human = calloc(1, sizeof(VBHuman));
    assert(human);
    
    human->_retainCount = 1;
    
    return human;
}

#pragma mark-
#pragma mark Accessors

void VBHumanSetName(VBHuman *human, char *name) {
    VBReturnMacro(human);
    
    if (NULL != human->_name) {
        free(human->_name);
    } else if (NULL == human->_name) {
        return;
    }
    
    human->_name = strdup(name);
}

char *VBHumanGetName(VBHuman *human) {
    VBReturnNullMacro(human);
    
    return human->_name;
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
    
    if (human->_children[index] == NULL) {
        if (VBHumanGetGender(human) == kVBHumanMaleGenderType) {
            VBRetainMacro(child->_father, human);
        } else {
            VBRetainMacro(child->_mother, human);
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
    
    if ((human->_partner != NULL) || (partner->_partner != NULL)) {
        return;
    }
    
    VBHumanSetPartner(human, partner);
    VBHumanSetPartner(partner, human);
}

void VBHumanDivorce(VBHuman *human) {
    VBReturnMacro(human);
    
    VBHumanSetPartner(VBHumanGetPartner(human), NULL);
    VBHumanSetPartner(human, NULL);
}

void VBHumanAddChildren(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    int index = 0;
    for (index = 0; VBHumanGetChildAtIndex(human, index) != NULL; index++) {
        if (index == (kVBChildrenCount - 1)) {
            return;
        }
    }
    
    VBHumanSetChildAtIndex(human, child, index);
}

void VBHumanRemoveChildrenIndex(VBHuman *human, VBHuman *child) {
    VBReturnMacro(human);
    
    for (int index = 0; index < kVBChildrenCount; index++) {
        if (VBHumanGetChildAtIndex(human, index) == child) {
            VBHumanGetGender(human) == kVBHumanMaleGenderType
            ? VBHumanSetFather(human->_children[index], NULL)
            : VBHumanSetMother(human->_children[index], NULL);
            human->_children[index] = NULL;
        }
    }
}

void VBHumanBirthChild(VBHuman *human, VBHuman *partner, VBHuman *child) {
    VBReturnMacro(human);
    VBReturnMacro(partner);
    
    if (VBHumanGetIsMarried(human) == true) {
        VBHumanAddChildren(human, child);
        VBHumanAddChildren(partner, child);
    }
}

void VBHumanRemoveAllChildrenIndex(VBHuman *human) {
    VBReturnMacro(human);
    
    for (int index = 0; index < kVBChildrenCount; index++) {
        if (VBHumanGetChildAtIndex(human, index) != NULL) {
            VBHumanGetGender(human) == kVBHumanMaleGenderType
            ? VBHumanSetFather(human->_children[index], NULL)
            : VBHumanSetMother(human->_children[index], NULL);
            human->_children[index] = NULL;
        }
    }
}

#pragma mark -
#pragma mark Public

void VBHumanRetain(VBHuman *human) {
    VBReturnMacro(human);
    
    human->_retainCount++;
}

void VBHumanRelease(VBHuman *human) {
    VBReturnMacro(human);
    
    human->_retainCount--;
    
    if (0 == human->_retainCount) {
        __VBHumanDeallocate(human);
    }
}
