//
//  VBHuman.h
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBHuman_h
#define VBHuman_h

#include <stdio.h>
#include <stdbool.h>

typedef struct VBHuman VBHuman;

typedef enum {
    kVBUndefindeGenderType,
    kVBHumanMaleGenderType,
    kVBHumanFemaleGenderType,
} VBHumanGenderType;

extern
VBHuman *VBHumanCreateWithNameGender(char *name, VBHumanGenderType gender);

extern
char *VBHumanGetName(VBHuman *human);

extern
VBHumanGenderType VBHumanGetGender(VBHuman *human);

extern
void VBHumanSetAge(VBHuman *human, uint8_t age);

extern
uint8_t VBHumanGetAge(VBHuman *human);

extern
void VBHumanSetChild(VBHuman *human, uint8_t child);

extern
uint8_t VBHumanGetChild(VBHuman *human);

extern
bool VBHumanGetIsMarried(VBHuman *human);

extern
void VBHumanMarry(VBHuman *human, VBHuman *partner);

extern
void VBHumanDivorce(VBHuman *human);

extern
void VBHumanRetain(VBHuman *human);

extern
void VBHumanRelease(VBHuman *human);

extern
void VBHumanRemoveChildrenIndex(VBHuman *human, VBHuman *child);

extern
VBHuman *VBHumanGetFather(VBHuman *human);

extern
VBHuman *VBHumanGetMother(VBHuman *human);

extern
void VBHumanAddChildren(VBHuman *human, VBHuman *child);

extern
VBHuman *VBHumanGetChildAtIndex(VBHuman *human, uint8_t index);

extern
void VBHumanBirthChild(VBHuman *human, VBHuman *partner, VBHuman *child);

#endif /* VBHuman_h */



