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
void VBLinkedListEnumeratorSetCarentNode(VBLinkedListEnumerator *enumerator,
                                                        VBLinkedListNode *node);

static
VBLinkedListNode *VBLinkedListEnumeratorGetCarentNode(VBLinkedListEnumerator *enumerator);

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
    VBLinkedListEnumeratorSetCarentNode(enumerator, NULL);
    
    __VBObjectDeallocate(enumerator);
}

VBLinkedListEnumerator *VBLinkedListEnumeratorCreateWithList(VBLinkedList *list) {
    VBLinkedListEnumerator *enumerator = VBObjectCreate(VBLinkedListEnumerator);
    VBLinkedListEnumeratorSetList(enumerator, list);
    
    uint64_t mutationsCount = VBLinkedListGetMutaitonsCount(list);
    VBLinkedListEnumeratorSetMutationsCount(enumerator, mutationsCount);
    
    VBLinkedListEnumeratorSetValid(enumerator, true);
    VBLinkedListEnumeratorSetCarentNode(enumerator, NULL);
    
    return enumerator;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedListEnumeratorSetList(VBLinkedListEnumerator *enumerator,
                                   VBLinkedList *list)
{
    VBReturnMacro(enumerator);
    VBAssignMacro(enumerator->_list, list);
}

VBLinkedList *VBLinkedListEnumeratorGetList(VBLinkedListEnumerator *enumerator) {
    return enumerator ? enumerator->_list : NULL;
}

void VBLinkedListEnumeratorSetCarentNode(VBLinkedListEnumerator *enumerator,
                                                        VBLinkedListNode *node)
{
    VBReturnMacro(enumerator);
    VBAssignMacro(enumerator->_carentNode, node);
}

VBLinkedListNode *VBLinkedListEnumeratorGetCarentNode(VBLinkedListEnumerator *enumerator) {
    return enumerator ? enumerator->_carentNode : NULL;
}

VBLinkedListNode *VBLinkedListEnumeratorGetNextNode(VBLinkedListEnumerator *enumerator) {
    VBLinkedListNode *node = VBLinkedListEnumeratorGetCarentNode(enumerator);
    VBLinkedList *list = VBLinkedListEnumeratorGetList(enumerator);
    
    uint64_t mutationsCounts = VBLinkedListEnumeratorGetMutationsCount(enumerator);
    if (mutationsCounts != VBLinkedListGetMutaitonsCount(list)) {
        VBLinkedListEnumeratorSetValid(enumerator, false);
    }
    
    if (NULL == node) {
        node = VBLinkedListGetHead(list);
    } else { 
        node = VBLinkedListNodeGetNextNode(node);
    }
    
    if (NULL == node) {
        VBLinkedListEnumeratorSetValid(enumerator, false);
    }
    
    VBLinkedListEnumeratorSetCarentNode(enumerator, node);
    
    return node;
}

void VBLinkedListEnumeratorSetMutationsCount(VBLinkedListEnumerator *enumerator,
                                              uint64_t mutationsCount)
{
    VBReturnMacro(enumerator);
    VBAssignMacro(enumerator->_mutationsCount, mutationsCount);
}

uint64_t VBLinkedListEnumeratorGetMutationsCount(VBLinkedListEnumerator *enumerator) {
    return enumerator ? enumerator->_mutationsCount : 0;
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


