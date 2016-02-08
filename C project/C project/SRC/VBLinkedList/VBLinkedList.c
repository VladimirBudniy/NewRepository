//
//  VBLinkedList.c
//  C project
//
//  Created by Vladimir Budniy on 06.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBLinkedList.h"
#include "VBMacroHeader.h"

#include <stdio.h>


#pragma mark-
#pragma mark Private Declarations

static
void __VBLinkedListDeallocate(VBLinkedList *node);

static
void VBLinkedListSetHead(VBLinkedList *list, VBLinkedListNode *node);

static
VBLinkedListNode *VBLinkedListGetHead(VBLinkedList *list);

static
void VBLinkedListSetFirstObject(VBLinkedList *list, void *object);

static
void VBLinkedListSetCount(VBLinkedList *list, uint64_t count);

static
void *VBLinkedListGetLastNode(VBLinkedList *list);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListDeallocate(VBLinkedList *list) {
    VBLinkedListSetHead(list, NULL);
    VBLinkedListSetCount(list, 0);
    
    __VBObjectDeallocate(list);
}

VBLinkedList *VBLinkedlistCreate(void) {
    VBLinkedList *list = VBObjectCreate(VBLinkedList);
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
    return list->_head;
}

void VBLinkedListSetFirstObject(VBLinkedList *list, void *object) {
    VBReturnMacro(list);
    
    VBLinkedListNode *node = VBLinkedListNodeCreateWithObject(object);
    VBLinkedListSetHead(list, node);
    VBLinkedListSetCount(list, VBLinkedListGetCount(list) +1);
    
    VBObjectRelease(node);
}

void VBLinkedListSetCount(VBLinkedList *list, uint64_t count) {
    VBReturnMacro(list)
    
    VBAssignMacro(list->_count, count);
}

uint64_t VBLinkedListGetCount(VBLinkedList *list) {
    return  list->_count;
}

#pragma mark-
#pragma mark Public Implementations

bool VBLinkedListContainsObject(VBLinkedList *list, void *object) {
    VBReturnValueMacro(list, NULL);
    
    VBLinkedListNode *node = VBLinkedListGetHead(list);
    while (NULL != VBLinkedListNodeGetNextNode(node)) {
        if (VBLinkedListNodeGetObject(node) == object) {
            return true;
        }
        
        node = VBLinkedListNodeGetNextNode(node);
    }
    
    return false;
}
void *VBLinkedListGetFirstObject(VBLinkedList *list) {
    VBLinkedListNode *node = VBLinkedListGetHead(list);
    
    return NULL != node ? VBLinkedListNodeGetObject(node): NULL;
}

void *VBLinkedListGetLastObject(VBLinkedList *list) {
    VBLinkedListNode *node = VBLinkedListGetLastNode(list);
    
    return NULL != node ? VBLinkedListNodeGetObject(node): NULL;
}

void *VBLinkedListGetLastNode(VBLinkedList *list) {
    VBReturnValueMacro(list, NULL);
    
    VBLinkedListNode *node = VBLinkedListGetHead(list);
    while (NULL != VBLinkedListNodeGetNextNode(node)) {
        node = VBLinkedListNodeGetNextNode(node);
    }
    
    return node;
}

void VBLinkedListAddObject(VBLinkedList *list, void *object) { // check method
    VBReturnMacro(list);
    
    if (NULL == VBLinkedListGetFirstObject(list)) {
        VBLinkedListSetFirstObject(list, object);
    } else {
        VBLinkedListNode *node = VBLinkedListNodeCreateWithObject(object);
        VBLinkedListNodeSetNextNode(node, VBLinkedListGetHead(list));
        VBLinkedListSetHead(list, node);
        VBLinkedListSetCount(list, VBLinkedListGetCount(list) + 1);
        
        VBObjectRelease(node);
    }
}

void VBLinkedListRemoveObject(VBLinkedList *list, void *object) {
    VBReturnMacro(list);
    
    if (VBLinkedListContainsObject(list, object)) {
        VBLinkedListNode *node = VBLinkedListGetHead(list);
        VBLinkedListNode *nextNode = VBLinkedListNodeGetNextNode(node);
        
        if (object == VBLinkedListNodeGetObject(node)) {
            VBLinkedListSetHead(list, nextNode);
        } else {
            while (object != VBLinkedListNodeGetObject(nextNode)) {
                node = nextNode;
                nextNode = VBLinkedListNodeGetNextNode(node);
            }
            
            VBLinkedListNodeSetNextNode(node, VBLinkedListNodeGetNextNode(nextNode));
        }
        
        VBLinkedListSetCount(list, VBLinkedListGetCount(list) - 1);
    }
}

void VBLInkedListRemoveAllObjects(VBLinkedList *list) {
    VBReturnMacro(list);
    VBLinkedListSetHead(list, NULL);
    VBLinkedListSetCount(list, 0);
}

#pragma mark -
#pragma mark Private



