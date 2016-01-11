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

#endif /* VBHumanObject_h */

typedef struct VBHumanObject VBHumanObject;

typedef enum {
    kVBUndefindeSexType,
    kVBHumanMaleSexType,
    kVBHUmanFemaleSexType,
} VBHumanSexType;

VBHumanObject *__VBHumanObjectCreate(void);

extern
void __VBHumanObjectDeallocate(VBHumanObject *human);

extern
VBHumanObject *VBHumanObjectCreateWithName(char *name);

extern
void VBHumanObjectSetName(VBHumanObject *human, char *name);
extern
char *VBHumanObjectGetName(VBHumanObject *human);

extern
void VBHumanObjectSetSex(VBHumanObject *human, VBHumanSexType sex);
extern
VBHumanSexType VBHumanObjectGetSex(VBHumanObject *human);

extern
void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age);
extern
uint8_t VBHumanObjectGetAge(VBHumanObject *human);

extern
void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child);
extern
uint8_t VBHumanObjectGetChild(VBHumanObject *human);

extern
bool VBHumanObjectGetMarried(VBHumanObject *human);

extern
void VBHumanObjectMarry(VBHumanObject *human, VBHumanObject *partner);
extern
void VBHumanObjectDivorce(VBHumanObject *human);








