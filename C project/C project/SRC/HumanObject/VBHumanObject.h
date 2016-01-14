//
//  VBHumanObject.h
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBHumanObject_h
#define VBHumanObject_h

#include <stdio.h>
#include <stdbool.h>

typedef struct VBHumanObject VBHumanObject;

typedef enum {
    kVBUndefindeGenderType,
    kVBHumanMaleGenderType,
    kVBHumanFemaleGenderType,
} VBHumanGenderType;

extern
VBHumanObject *VBHumanObjectCreateWithGenderNamed(char *name, VBHumanGenderType gender);

extern
char *VBHumanObjectGetName(VBHumanObject *human);

extern
VBHumanGenderType VBHumanObjectGetGender(VBHumanObject *human);

extern
void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age);

extern
uint8_t VBHumanObjectGetAge(VBHumanObject *human);

extern
void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child);

extern
uint8_t VBHumanObjectGetChild(VBHumanObject *human);

extern
bool VBHumanObjectGetIsMarried(VBHumanObject *human);

extern
void VBHumanObjectMarry(VBHumanObject *human, VBHumanObject *partner);

extern
void VBHumanObjectDivorce(VBHumanObject *human);

extern
void VBHUmanObjectRetain(VBHumanObject *human);

extern
void VBHumanObjectRelease(VBHumanObject *human);

extern
void VBHumanObjectSetFather(VBHumanObject *human, VBHumanObject *parent);

extern
VBHumanObject *VBHumanObjectGetFather(VBHumanObject *human);

extern
void VBHumanObjectSetMother(VBHumanObject *human, VBHumanObject *mother);

extern
VBHumanObject *VBHumanObjectGetMother(VBHumanObject *human);

extern
void VBHumanObjectAddParent(VBHumanObject *human, VBHumanObject *father, VBHumanObject *mother);

#endif /* VBHumanObject_h */



