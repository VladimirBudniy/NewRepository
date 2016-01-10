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

VBHumanObject *_VBHumanObjectCreate(void);

void _VBHumanObjectDeallocate(VBHumanObject *human);

void VBHumanObjectSetName(VBHumanObject *human, char *name);
char *VBHumanObjectGetName(VBHumanObject *human);

void VBHumanObjectSetSex(VBHumanObject *human, char *sex);
char *VBHumanObjectGetSex(VBHumanObject *human);

void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age);
uint8_t *VBHumanObjectGetAge(VBHumanObject *human);

void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child);
uint8_t *VBHumanObjectGetChild(VBHumanObject *human);

void VBHumanObjectSetMarried(VBHumanObject *human, bool merried);
bool VBHumanObjectGetMarried(VBHumanObject *human);
