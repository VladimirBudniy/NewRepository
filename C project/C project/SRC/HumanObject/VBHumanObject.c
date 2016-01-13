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
    VBHumanObject *_father;
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

//static
//void VBHumanObjectSetFather(VBHumanObject *human, VBHumanObject *parent);
//
//static
//void VBHumanObjectSetMother(VBHumanObject *human, VBHumanObject *parent);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBHumanObjectDeallocate(VBHumanObject *human) {
    VBHumanObjectSetPartner(human, NULL);
    VBHumanObjectSetPartner(human, NULL); // зануляем родителей
    
    // здесь указываем всех на кого будут связи родители и дети и тд
    
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
    return human->_name;
}

void VBHumanObjectSetGender(VBHumanObject *human, VBHumanGenderType gender) {
    if (gender == kVBUndefindeGenderType) {
        
        return;
    }
    
    human->_gender = gender;
}

VBHumanGenderType VBHumanObjectGetGender(VBHumanObject *human) {
//    puts((human->_gender == kVBHumanMaleGenderType) ? "Male" : "Female"); // убрать в тест
    return human->_gender;
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
    
    VBHumanGenderType type = VBHumanObjectGetGender(human);
    
    if (type == kVBHumanFemaleGenderType) {
        human->_partner = partner;
    } else {
//        VBHumanObjectRelease(human->_partner); // зануляет human с счетчиком = 1
        human->_partner = partner;
        VBHUmanObjectRetain(human->_partner);
    }
}

VBHumanObject *VBHumanObjectGetPartner(VBHumanObject *human) {
    if (NULL == human) {
        
        return NULL;
    }

    return human->_partner;
}

bool VBHumanObjectGetMarried(VBHumanObject *human) {
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
}

// надо бъеденить маму и папу
void VBHUmanObjectSetParent(VBHumanObject *human, VBHumanObject *parent) {
    VBReturnMacro(human);
    VBReturnMacro(parent);
    if (NULL == human || human->_father == parent || human->_mother == parent) {

        return;
}
    VBHumanGenderType type = VBHumanObjectGetGender(human);
    
    if (type == kVBUndefindeGenderType) {
        return;
    }
    
    if (type == kVBHumanFemaleGenderType) {
        human->_mother = parent;
    } else {
        human->_father = parent;
    }
}

VBHumanObject *VBHumanObjectGetParent(VBHumanObject *human) {
    
    VBHumanGenderType type = VBHumanObjectGetGender(human);
    
    if (type == kVBUndefindeGenderType) {
        return NULL;
    }
    
    if (type == kVBHumanFemaleGenderType) {
        return human->_mother;
    } else {
        return human->_father;
    }
}

//void VBHumanObjectSetFather(VBHumanObject *human, VBHumanObject *parent) {
//    VBReturnMacro(human);
//    VBReturnMacro(parent);
//    if (NULL == human || human->_father == parent) {
//
//        return;
//    }
//    
//    human->_father = parent;
//}
//
//VBHumanObject *VBHumanObjectGetFather(VBHumanObject *human) {
//    return human->_father;
//}
//
//void VBHumanObjectSetMother(VBHumanObject *human, VBHumanObject *parent) {
//    VBReturnMacro(human);
//    VBReturnMacro(parent);
//    if (NULL == human || human->_mother == parent) {
//        
//        return;
//    }
//    
//    human->_mother = parent;
//}
//
//VBHumanObject *VBHumanObjectGetMother(VBHumanObject *human) {
//    return human->_mother;
//}

//void VBHumanObjectAddParent(VBHumanObject *human, VBHumanObject *parent) {
//    VBReturnMacro(human);
//    VBReturnMacro(parent);
//    
//    if (VBHumanObjectGetAge(human) >= VBHumanObjectGetAge(parent)) {
//        
//        return;
//    }
//    
//}

#pragma mark -
#pragma mark Public

void VBHUmanObjectRetain(VBHumanObject *human) {
    human->_retainCount++;
}

void VBHumanObjectRelease(VBHumanObject *human) {
    human->_retainCount--;
    
    if (0 == human->_retainCount) {
        __VBHumanObjectDeallocate(human);
    }
}
