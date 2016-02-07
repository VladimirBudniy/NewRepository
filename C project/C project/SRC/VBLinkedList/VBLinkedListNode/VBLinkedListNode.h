//
//  VBLinkedListNode.h
//  C project
//
//  Created by Vladimir Budniy on 06.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBLinkedListNode_h
#define VBLinkedListNode_h

#include <stdbool.h>

#include "VBMacroHeader.h"
#include "VBObject.h"

typedef struct VBLinkedListNode VBLinkedListNode;

struct VBLinkedListNode {
    VBObject _super;
    VBLinkedListNode *_nextNode;
    void *object;
};

extern
VBLinkedListNode *VBLinkedListNodeCreateWithObject(void *object);

extern
void VBLinkedListNodeSetObject(VBLinkedListNode *node, void *object);

extern
void *VBLinkedListNodeGetObject(VBLinkedListNode *node);

extern
void VBLinkedLisNodeSetNextNode(VBLinkedListNode *node, VBLinkedListNode *nextNode);

extern
VBLinkedListNode *VBLinkedLisNodeGetNextNode(VBLinkedListNode *node);


#endif /* VBLinkedListNode_h */
