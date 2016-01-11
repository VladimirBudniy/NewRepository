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
    VBHumanObject *parents;
    VBHumanObject *partner;
    VBHumanObject *children[20];
    char *_name;
    char *_sex;
    uint8_t _age;
    uint8_t _child;
    bool _married;
};

#pragma mark-
#pragma mark Initialization & Deallocation

VBHumanObject *_VBHumanObjectCreate(void) {
    VBHumanObject *human = calloc(1, sizeof(VBHumanObject));
    return human;
}

void _VBHumanObjectDeallocate(VBHumanObject *human) {
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

void VBHumanObjectSetSex(VBHumanObject *human, char *sex) {
    human->_sex = sex;
}

char *VBHumanObjectGetSex(VBHumanObject *human) {
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

void VBHumanObjectSetMarried(VBHumanObject *human, bool merried);
bool VBHumanObjectGetMarried(VBHumanObject *human);
