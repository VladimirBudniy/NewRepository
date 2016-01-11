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

#include "VBHumanObject.h"

struct VBHumanObject {
    VBHumanObject *_partner;      // +
    VBHumanObject *_papa;
    VBHumanObject *_mama;
    VBHumanObject *_children[20];
    VBHumanSexType _sex;          // +
    char *_name;                  // +
    uint8_t _age;                 // +
    uint8_t _child;               // +
    bool _married;                // +
};

#pragma mark-
#pragma mark Private Declarations

static
void VBHumanObjectSetPartner(VBHumanObject *human, VBHumanObject *partner);
static
VBHumanObject *VBHUmanObjectGetPartner(VBHumanObject *human);

#pragma mark-
#pragma mark Initialization & Deallocation

VBHumanObject *VBHumanObjectCreateWithName(char *name) {
    VBHumanObject *humanWithName = calloc(1, sizeof(VBHumanObject));
    VBHumanObjectSetName(humanWithName, name);
    return humanWithName;
}

VBHumanObject *__VBHumanObjectCreate(void) {
    VBHumanObject *human = calloc(1, sizeof(VBHumanObject));
    return human;
}

void __VBHumanObjectDeallocate(VBHumanObject *human) {
    free(human);
}

#pragma mark-
#pragma mark Accessors

void VBHumanObjectSetName(VBHumanObject *human, char *name) {
    human->_name = name;
}
char *VBHumanObjectGetName(VBHumanObject *human) {
    return human->_name;
}

void VBHumanObjectSetSex(VBHumanObject *human, VBHumanSexType sex) {
    if (sex == kVBUndefindeSexType) {
        return;
    }
    human->_sex = sex;
}
VBHumanSexType VBHumanObjectGetSex(VBHumanObject *human) {
    (human->_sex == kVBHumanMaleSexType) ? puts("Male") : puts("Female");
    return human->_sex;
}

void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age) {
    human->_age = age;
}
uint8_t VBHumanObjectGetAge(VBHumanObject *human) {
    return human->_age;
}

void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child) {
    human->_child = child;
}
uint8_t VBHumanObjectGetChild(VBHumanObject *human) {
    return human->_child;
}

void VBHumanObjectSetPartner(VBHumanObject *human, VBHumanObject *partner) {
    if (NULL == human || human->_partner == partner) {
        return;
    }
    
    human->_partner = partner;
}

VBHumanObject *VBHUmanObjectGetPartner(VBHumanObject *human) {
    if (NULL == human) {
        return NULL;
    }
    return human->_partner;
}

bool VBHumanObjectGetMarried(VBHumanObject *human) {
    return VBHUmanObjectGetPartner(human) ? true : false;
}

void VBHumanObjectMarry(VBHumanObject *human, VBHumanObject *partner) {
    VBHumanObjectSetPartner(human, partner);
    VBHumanObjectSetPartner(partner, human);
}

void VBHumanObjectDivorce(VBHumanObject *human) {
    VBHumanObjectSetPartner(VBHUmanObjectGetPartner(human), NULL);
    VBHumanObjectSetPartner(human, NULL);
}
