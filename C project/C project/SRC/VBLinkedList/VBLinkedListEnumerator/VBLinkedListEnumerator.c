//
//  VBLinkedListEnumerator.c
//  C project
//
//  Created by Vladimir Budniy on 09.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBLinkedListEnumerator.h"
#include "VBLinkedListPrivate.h"
#include "VBLinkedListNode.h"

#pragma mark-
#pragma mark Private Declarations

static
void VBLinkedListEnumeratorSetList(VBLinkedListEnumerator *enumerator,
                                   VBLinkedList *list);

static
VBLinkedList *VBLinkedListEnumeratorGetList(VBLinkedListEnumerator *enumerator);

static
void VBLinkedListEnumeratorSetCurrentNode(VBLinkedListEnumerator *enumerator,
                                          VBLinkedListNode *node);

static
VBLinkedListNode *VBLinkedListEnumeratorGetCurrentNode(VBLinkedListEnumerator *enumerator);

static
void VBLinkedListEnumeratorSetMutationsCount(VBLinkedListEnumerator *enumerator,
                                             uint64_t mutationsCount);

static
uint64_t VBLinkedListEnumeratorGetMutationsCount(VBLinkedListEnumerator *enumerator);

static
void VBLinkedListEnumeratorSetValid(VBLinkedListEnumerator *enumerator,
                                    bool valid);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListEnumeratorDeallocate(VBLinkedListEnumerator *enumerator) {
    VBLinkedListEnumeratorSetList(enumerator, NULL);
    VBLinkedListEnumeratorSetCurrentNode(enumerator, NULL);
    
    __VBObjectDeallocate(enumerator);
}

VBLinkedListEnumerator *VBLinkedListEnumeratorCreateWithList(VBLinkedList *list) {
    VBLinkedListEnumerator *enumerator = VBObjectCreate(VBLinkedListEnumerator);
    VBLinkedListEnumeratorSetList(enumerator, list);
    
    uint64_t mutationsCount = VBLinkedListGetMutationsCount(list);
    VBLinkedListEnumeratorSetMutationsCount(enumerator, mutationsCount);
    
    VBLinkedListEnumeratorSetValid(enumerator, true);
    VBLinkedListEnumeratorSetCurrentNode(enumerator, NULL);
    
    return enumerator;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedListEnumeratorSetList(VBLinkedListEnumerator *enumerator,
                                   VBLinkedList *list)
{
    VBReturnMacro(enumerator);
    VBRetainMacro(enumerator->_list, list);
}

VBLinkedList *VBLinkedListEnumeratorGetList(VBLinkedListEnumerator *enumerator) {
    VBReturnValueMacro(enumerator, NULL);
    
    return enumerator->_list;
}

void VBLinkedListEnumeratorSetCurrentNode(VBLinkedListEnumerator *enumerator,
                                          VBLinkedListNode *node)
{
    VBReturnMacro(enumerator);
    VBRetainMacro(enumerator->_currentNode, node);
}

VBLinkedListNode *VBLinkedListEnumeratorGetCurrentNode(VBLinkedListEnumerator *enumerator) {
    VBReturnValueMacro(enumerator, NULL);
    
    return enumerator->_currentNode;
}

VBLinkedListNode *VBLinkedListEnumeratorGetNextNode(VBLinkedListEnumerator *enumerator) {
    VBLinkedList *list = VBLinkedListEnumeratorGetList(enumerator);
    VBLinkedListNode *node = VBLinkedListEnumeratorGetCurrentNode(enumerator);
    
    if (!node) {
        node = VBLinkedListGetHead(list);
    } else {
        node = VBLinkedListNodeGetNextNode(node);
    }
    
    uint64_t mutationsCounts = VBLinkedListEnumeratorGetMutationsCount(enumerator);
    if (mutationsCounts != VBLinkedListGetMutationsCount(list) || !node) {
        VBLinkedListEnumeratorSetValid(enumerator, false);
    }
    
    VBLinkedListEnumeratorSetCurrentNode(enumerator, node);
    
    return node;
}

void VBLinkedListEnumeratorSetMutationsCount(VBLinkedListEnumerator *enumerator,
                                             uint64_t mutationsCount)
{
    VBReturnMacro(enumerator);
    VBAssignMacro(enumerator->_mutationsCount, mutationsCount);
}

uint64_t VBLinkedListEnumeratorGetMutationsCount(VBLinkedListEnumerator *enumerator) {
    VBReturnValueMacro(enumerator, 0);
    
    return enumerator->_mutationsCount;
}

void VBLinkedListEnumeratorSetValid(VBLinkedListEnumerator *enumerator,
                                    bool valid)
{
    VBReturnMacro(enumerator);
    VBAssignMacro(enumerator->_valid, valid);
}

bool VBLinkedListEnumeratorIsValid(VBLinkedListEnumerator *enumerator) {
    VBReturnValueMacro(enumerator, false);
    
    return enumerator->_valid;
}


