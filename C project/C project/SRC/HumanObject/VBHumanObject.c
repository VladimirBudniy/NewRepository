//
//  VBHumanObject.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

#include "VBHumanObject.h"
#include "VBMacroHeader.h"

struct VBHumanObject {
    VBHumanObject *_partner;      // +
    VBHumanObject *_father;       // +
    VBHumanObject *_mother;
    VBHumanObject *_children[20];
    VBHumanGenderType _gender;    // +
    char *_name;                  // +
    uint8_t _age;                 // +
    uint8_t _child;               // +
    uint32_t _retainCount;        // +
};

#pragma mark-
#pragma mark Private Declarations

static
void __VBHumanObjectDeallocate(VBHumanObject *human);

static
VBHumanObject *__VBHumanObjectCreate(void);

static
void VBHumanObjectSetName(VBHumanObject *human, char *name);

static
void VBHumanObjectSetPartner(VBHumanObject *human, VBHumanObject *partner);

static
void VBHumanObjectSetGender(VBHumanObject *human, VBHumanGenderType sex);

static
VBHumanObject *VBHumanObjectGetPartner(VBHumanObject *human);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBHumanObjectDeallocate(VBHumanObject *human) {
    VBHumanObjectSetPartner(human, NULL);
    VBHumanObjectSetFather(human, NULL);
    VBHumanObjectSetMother(human, NULL);
    VBHumanObjectMarry(human, NULL);
    
    free(human);
}

VBHumanObject *VBHumanObjectCreateWithGenderNamed(char *name, VBHumanGenderType gender) {
    VBHumanObject *human = __VBHumanObjectCreate();
    VBHumanObjectSetName(human, name);
    VBHumanObjectSetGender(human, gender);
    
    return human;
}

VBHumanObject *__VBHumanObjectCreate(void) {
    VBHumanObject *human = calloc(1, sizeof(VBHumanObject));
    assert(human);
    
    human->_retainCount = 1;
    
    return human;
}

#pragma mark-
#pragma mark Accessors

void VBHumanObjectSetName(VBHumanObject *human, char *name) {
    VBReturnMacro(human);
    human->_name = name;
}

char *VBHumanObjectGetName(VBHumanObject *human) {
    VBReturnNullMacro(human);
    
    return human->_name;
}

void VBHumanObjectSetGender(VBHumanObject *human, VBHumanGenderType gender) {
    VBReturnMacro(human);
    if (gender == kVBUndefindeGenderType) {
        return;
    }
    
    human->_gender = gender;
}

VBHumanGenderType VBHumanObjectGetGender(VBHumanObject *human) {
    return human->_gender;
}

void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age) {
    VBReturnMacro(human);
    human->_age = age;
}

uint8_t VBHumanObjectGetAge(VBHumanObject *human) {
    VBReturnValueMacro(human);
    
    return human->_age;
}

void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child) {
    VBReturnMacro(human);
    human->_child = child;
}

uint8_t VBHumanObjectGetChild(VBHumanObject *human) {
    VBReturnValueMacro(human);
    
    return human->_child;
}

void VBHumanObjectSetPartner(VBHumanObject *human, VBHumanObject *partner) {
    VBReturnMacro(human);
    VBReturnMacro(partner);
    
    VBHumanGenderType type = VBHumanObjectGetGender(human);
    
    if (type == kVBHumanFemaleGenderType) {
        VBAssignMacro(human->_partner, partner);
    } else {
        VBRetainMacro(human->_partner, partner);
    }
}

VBHumanObject *VBHumanObjectGetPartner(VBHumanObject *human) {
    VBReturnNullMacro(human);

    return human->_partner;
}

bool VBHumanObjectGetIsMarried(VBHumanObject *human) {
    VBReturnNullMacro(human);
    return VBHumanObjectGetPartner(human) ? true : false;
}

void VBHumanObjectMarry(VBHumanObject *human, VBHumanObject *partner) {
    VBReturnMacro(human);
    VBReturnMacro(partner);
    if (VBHumanObjectGetGender(human) == VBHumanObjectGetGender(partner)) {
        return;
    }
    
    VBHumanObjectSetPartner(human, partner);
    VBHumanObjectSetPartner(partner, human);
}

void VBHumanObjectDivorce(VBHumanObject *human) {
    VBReturnMacro(human);
    
    VBHumanObjectSetPartner(VBHumanObjectGetPartner(human), NULL);
    VBHumanObjectSetPartner(human, NULL);
    VBHumanObjectRelease(human);
}

void VBHumanObjectSetMother(VBHumanObject *human, VBHumanObject *mother) {
    VBReturnMacro(human);
    VBReturnMacro(mother);
    VBRetainMacro(human->_mother, mother);
}

VBHumanObject *VBHumanObjectGetMother(VBHumanObject *human) {
    VBReturnNullMacro(human);

    return human->_mother;
}

void VBHumanObjectSetFather(VBHumanObject *human, VBHumanObject *father) {
    VBReturnMacro(human);
    VBReturnMacro(father);
    VBRetainMacro(human->_father, father);
}

VBHumanObject *VBHumanObjectGetFather(VBHumanObject *human) {
    VBReturnNullMacro(human);
    
    return human->_father;
}

//void VBHumanObjectAddParents(VBHumanObject *human, VBHumanObject *father, VBHumanObject *mother) {
//    VBReturnMacro(human);
//    VBReturnMacro(father);
//    VBReturnMacro(mother);
//    
//    VBHumanObjectSetMother(human, mother);
//    VBHumanObjectSetFather(human, father);
//    
//}

void VBHumanObjectRemoveMother(VBHumanObject *human, VBHumanObject *mother) {
    VBReturnMacro(human);
    VBReturnMacro(mother);
    
    VBHumanObjectSetMother(VBHumanObjectGetMother(human), NULL);
    VBHumanObjectSetMother(human, NULL);
    VBHumanObjectRelease(mother);
}

void VBHumanObjectRemoveFather(VBHumanObject *human, VBHumanObject *father) {
    VBReturnMacro(human);
    VBReturnMacro(father);
    
    VBHumanObjectSetFather(VBHumanObjectGetFather(human), NULL);
    VBHumanObjectSetFather(human, NULL);
    VBHumanObjectRelease(father);
}

void VBHumanObjectAddChildrenIndex(VBHumanObject *human, VBHumanObject *child) {
    VBReturnMacro(human);
    VBReturnMacro(child);
    
    int size = 5;
    int index = 0;
    for (index = 0; (human->_children[index] != NULL); index++) {
        if (index == size) {
            return;
    }
    }
    VBRetainMacro(human->_children[index], child)
}

void VBHumanObjectRemoveChildrenIndex(VBHumanObject *human, VBHumanObject *child) {
    VBReturnMacro(human);
    VBReturnMacro(child);
    
    int size = 5;
    int index = 0;
    for (index = 0; (human->_children[index] != NULL); index++) {
        if (index == size) {
            return;
        }
    }
    human->_children[index] = NULL;
    VBHumanObjectRelease(child);
}

#pragma mark -
#pragma mark Public

void VBHUmanObjectRetain(VBHumanObject *human) {
    VBReturnMacro(human);
    human->_retainCount++;
}

void VBHumanObjectRelease(VBHumanObject *human) {
    VBReturnMacro(human);
    human->_retainCount--;
    
    if (0 == human->_retainCount) {
        __VBHumanObjectDeallocate(human);
    }
}
