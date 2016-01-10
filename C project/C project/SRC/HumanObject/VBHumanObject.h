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

#endif /* VBHumanObject_h */

typedef struct VBHumanDataObject VBHumanObject;

VBHumanObject *_VBHumanObjectCreate(void);

void _VBHumanObjectDeallocate(VBHumanObject *human);

void VBHumanObjectSetName(VBHumanObject *human, char *name);
char *VBHumanObjectGetName(VBHumanObject *human);
    
void VBHumanObjectSetAge(VBHumanObject *human, uint8_t age);
uint8_t *VBHumanObjectGetAge(VBHumanObject *human);

void VBHumanObjectSetChild(VBHumanObject *human, uint8_t child);
uint8_t *VBHumanObjectGetChild(VBHumanObject *human);

void VBHumanObjectSetSex(VBHumanObject *human, bool sex);
bool *VBHumanObjectGetSex(VBHumanObject *human);

void VBHumanObjectSetMarried(VBHumanObject *human, bool merried);
bool VBHumanObjectGetMarried(VBHumanObject *human);
