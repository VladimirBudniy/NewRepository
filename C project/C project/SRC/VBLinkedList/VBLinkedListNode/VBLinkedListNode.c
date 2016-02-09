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

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListNodeDeallocate(VBLinkedListNode *node) {
    VBLinkedListNodeSetObject(node, NULL);
    VBLinkedListNodeSetNextNode(node, NULL);
    
    __VBObjectDeallocate(node);
}

VBLinkedListNode *VBLinkedListNodeCreateWithObject(void *object) {
    VBLinkedListNode *node = VBObjectCreate(VBLinkedListNode);
    VBLinkedListNodeSetObject(node, object);
    
    return node;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedListNodeSetObject(VBLinkedListNode *node, void *object) {
    VBReturnMacro(node);
    
    VBRetainMacro(node->object, object);
}

void *VBLinkedListNodeGetObject(VBLinkedListNode *node) {
    VBReturnValueMacro(node, NULL);
    
    return node->object;
}

void VBLinkedListNodeSetNextNode(VBLinkedListNode *node, VBLinkedListNode *nextNode) {
    VBReturnMacro(node);
    
    VBRetainMacro(node->_nextNode, nextNode);
}

VBLinkedListNode *VBLinkedListNodeGetNextNode(VBLinkedListNode *node) {
    VBReturnValueMacro(node, NULL);
    
    return node ? node->_nextNode : NULL;
}




