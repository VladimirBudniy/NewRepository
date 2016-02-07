//
//  VBLinkedListNode.c
//  C project
//
//  Created by Vladimir Budniy on 06.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBLinkedListNode.h"

#include <stdio.h>

#pragma mark-
#pragma mark Private Declarations

static
void __VBLinkedListNodeDeallocate(VBLinkedListNode *node);

static
VBLinkedListNode *VBLinkedListNodeCreate(void);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListNodeDeallocate(VBLinkedListNode *node) {
    VBLinkedListNodeSetObject(node, NULL);
    
    __VBObjectDeallocate(node);
}

VBLinkedListNode *VBLinkedListNodeCreate(void) {
    VBLinkedListNode *node = VBObjectCreate(VBLinkedListNode);
    
    return node;
}

VBLinkedListNode *VBLinkedListNodeCreateWithObject(void *object) {
    VBLinkedListNode *node = VBLinkedListNodeCreate();
    VBLinkedListNodeSetObject(node, object);
    
    return node;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedLisNodeSetNextNode(VBLinkedListNode *node, VBLinkedListNode *nextNode) {
    VBReturnMacro(node);
    
    VBAssignMacro(node, nextNode);
}

VBLinkedListNode *VBLinkedLisNodeGetNextNode(VBLinkedListNode *node) {
    return node->_nextNode;
}

void VBLinkedListNodeSetObject(VBLinkedListNode *node, void *object) {
    VBReturnMacro(node);
    
    VBAssignMacro(node->object, object);
}

void *VBLinkedListNodeGetObject(VBLinkedListNode *node) {
    VBReturnValueMacro(node, NULL);
    
    return node->object;
}



