//
//  VBLinkedList.c
//  C project
//
//  Created by Vladimir Budniy on 06.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBLinkedList.h"
#include "VBMacroHeader.h"
#include "VBLinkedListEnumerator.h"
#include "VBLinkedListPrivate.h"
#include "VBLinkedListEnumeratorPrivate.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#pragma mark-
#pragma mark Private Declarations

#define VBLinkedListContextCreateMacro(type, name, object) \
        type *name = calloc(1, sizeof(type)); \
        assert(name); \
        name->_object = object;

static
void __VBLinkedListDeallocate(VBLinkedList *node);

static
void VBLinkedListSetHead(VBLinkedList *list, VBLinkedListNode *node);

static
void VBLinkedListSetCount(VBLinkedList *list, uint64_t count);

static
void VBLinkedListAddNode(VBLinkedList *list, VBLinkedListNode *node);

static
void VBLinkedListSetMutationsCount(VBLinkedList *list, uint64_t mutationsCount);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListDeallocate(VBLinkedList *list) {
    VBLinkedListSetHead(list, NULL);
    VBLinkedListSetMutationsCount(list, 0);
    VBLinkedListSetCount(list, 0);
    
    __VBObjectDeallocate(list);
}

VBLinkedList *VBLinkedlistCreate(void) {
    VBLinkedList *list = VBObjectCreate(VBLinkedList);
    VBLinkedListSetMutationsCount(list, 0);
    VBLinkedListSetCount(list, 0);
    
    return list;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedListSetHead(VBLinkedList *list, VBLinkedListNode *node) {
    VBReturnMacro(list);
    
    VBRetainMacro(list->_head, node);
}

VBLinkedListNode *VBLinkedListGetHead(VBLinkedList *list) {
    VBReturnValueMacro(list, NULL);
    
    return list->_head;
}

void VBLinkedListSetCount(VBLinkedList *list, uint64_t count) {
    VBReturnMacro(list)
    
    VBAssignMacro(list->_count, count);
    VBLinkedListSetMutationsCount(list, VBLinkedListGetMutationsCount(list) + 1);
}

uint64_t VBLinkedListGetCount(VBLinkedList *list) {
    return  list->_count;
}

void VBLinkedListSetMutationsCount(VBLinkedList *list, uint64_t mutationsCount) {
    VBReturnMacro(list);
    
    VBAssignMacro(list->_mutationsCount, mutationsCount);
}

uint64_t VBLinkedListGetMutationsCount(VBLinkedList *list) {
    VBReturnValueMacro(list, 0);
    
    return list->_mutationsCount;
}

#pragma mark-
#pragma mark Public Implementations

bool VBLinkedListContainsObject(VBLinkedList *list, void *object) {
    VBReturnValueMacro(list, NULL);
    
    VBLinkedListContextCreateMacro(VBLinkedListContext, context, object);
    
    VBLinkedListNode *node = VBLinkedListGetNodeWithContext(list,
                                                            VBLinkedListNodeContainseObject,
                                                            context);
    
    free(context);
    
    return node;
}

void *VBLinkedListGetFirstObject(VBLinkedList *list) {
    VBLinkedListNode *node = VBLinkedListGetHead(list);
    
    return NULL != node ? VBLinkedListNodeGetObject(node): NULL;
}

void VBLinkedListAddObject(VBLinkedList *list, void *object) {
    VBReturnMacro(list);
    
    VBLinkedListNode *node = VBLinkedListNodeCreateWithObject(object);
    VBLinkedListAddNode(list, node);
    VBObjectRelease(node);
}

void VBLinkedListRemoveObject(VBLinkedList *list, void *object) {
    VBReturnMacro(list);

    VBLinkedListContextCreateMacro(VBLinkedListContext, context, object);
    
    VBLinkedListNode *node = VBLinkedListGetNodeWithContext(list,
                                                            VBLinkedListNodeContainseObject,
                                                            context);
    
    if (node) {
        VBLinkedListNodeSetNextNode(context->_previosNode, VBLinkedListNodeGetNextNode(node));
    }
    
    free(context);
    
    VBLinkedListSetCount(list, VBLinkedListGetCount(list) - 1);
}

void VBLinkedListRemoveAllObjects(VBLinkedList *list) {
    VBReturnMacro(list);
    
    VBLinkedListSetHead(list, NULL);
    VBLinkedListSetCount(list, 0);
}

#pragma mark -
#pragma mark Private

void VBLinkedListAddNode(VBLinkedList *list, VBLinkedListNode *node) {
    VBReturnMacro(list);
    
    VBLinkedListNodeSetNextNode(node, VBLinkedListGetHead(list));
    VBLinkedListSetHead(list, node);
    VBLinkedListSetCount(list, VBLinkedListGetCount(list) + 1);
}

bool VBLinkedListNodeContainseObject(VBLinkedListContext *context) {
    return VBLinkedListNodeGetObject(context->_node) == context->_object;
}

extern
VBLinkedListNode *VBLinkedListGetNodeWithContext(VBLinkedList *list,
                                                 VBLinkedListComparison *comparator,
                                                 VBLinkedListContext *context)
{
    VBLinkedListEnumerator *enumerator = VBLinkedListEnumeratorCreateWithList(list);
    VBLinkedListNode *node = NULL;
    
    while (VBLinkedListEnumeratorIsValid(enumerator)) {
        node = VBLinkedListEnumeratorGetNextNode(enumerator);
        
        context->_node = node;
        
        if (comparator(context)) {
            break;
        }
        
        context->_previosNode = node;
    }
    
    VBObjectRelease(enumerator);
    
    return node;
}


