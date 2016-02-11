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

#pragma mark-
#pragma mark Private Declarations

static
void __VBLinkedListDeallocate(VBLinkedList *node);

static
void VBLinkedListSetHead(VBLinkedList *list, VBLinkedListNode *node);

static
void VBLinkedListSetCount(VBLinkedList *list, uint64_t count);

static
void VBLinkedListAddNode(VBLinkedList *list, VBLinkedListNode *node);

static
void VBLinkedListRemoveNode(VBLinkedList *list, VBLinkedListNode *node);

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
    VBLinkedListSetMutationsCount(list, VBLinkedListGetMutaitonsCount(list) + 1);
}

uint64_t VBLinkedListGetCount(VBLinkedList *list) {
    return  list->_count;
}

void VBLinkedListSetMutationsCount(VBLinkedList *list, uint64_t mutationsCount) {
    VBReturnMacro(list);
    
    VBAssignMacro(list->_mutationsCount, mutationsCount);
}

uint64_t VBLinkedListGetMutaitonsCount(VBLinkedList *list) {
    return list->_mutationsCount;
}

uint64_t VBLinkedListGetMutationsCount(VBLinkedList *list) {
    return list->_mutationsCount;
}

#pragma mark-
#pragma mark Public Implementations

bool VBLinkedListContainsObject(VBLinkedList *list, void *object) {
    VBReturnValueMacro(list, NULL);
    
    VBLinkedListEnumerator *enumerator = VBLinkedListEnumeratorCreateWithList(list);
    
    while (VBLinkedListEnumeratorIsValid(enumerator)) {
        VBLinkedListNode *node = VBLinkedListEnumeratorGetNextNode(enumerator);
        if (object == VBLinkedListNodeGetObject(node)) {
            return true;
        }
        
    }
    
    VBObjectRelease(enumerator);
    
    return false;
}

//    VBLinkedListNode *node = VBLinkedListGetHead(list);
//    while (NULL != node) {
//        if (VBLinkedListNodeGetObject(node) == object) {
//            return true;
//        }
//        
//        node = VBLinkedListNodeGetNextNode(node);
//    }
//    
//    return false;
//}

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

    VBLinkedListEnumerator *enumerator = VBLinkedListEnumeratorCreateWithList(list);
    
    while (VBLinkedListEnumeratorIsValid(enumerator)) {
        VBLinkedListNode *node = VBLinkedListEnumeratorGetNextNode(enumerator);
        if (object == VBLinkedListNodeGetObject(node)) {
            VBLinkedListRemoveNode(list, node);
        }
    }

    VBObjectRelease(enumerator);
}

//    VBLinkedListNode *node = VBLinkedListGetHead(list);
//    VBLinkedListNode *nextNode = VBLinkedListNodeGetNextNode(node);
//    while (NULL != node) {
//        if (object == VBLinkedListNodeGetObject(node)) {
//            VBLinkedListRemoveNode(list, node);
//        }
//        
//        node = nextNode;
//        nextNode = VBLinkedListNodeGetNextNode(node);
//    }

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

void VBLinkedListRemoveNode(VBLinkedList *list, VBLinkedListNode *node) {
    VBReturnMacro(list);
    
    VBLinkedListNode *firstNode = VBLinkedListGetHead(list);
    VBLinkedListNode *secondNode = VBLinkedListNodeGetNextNode(firstNode);
    
    if (firstNode == node) {
        VBLinkedListSetHead(list, VBLinkedListNodeGetNextNode(firstNode));
    } else {
        while (secondNode != node) {
            firstNode = secondNode;
            secondNode = VBLinkedListNodeGetNextNode(secondNode);
        }
        
        VBLinkedListNodeSetNextNode(firstNode, VBLinkedListNodeGetNextNode(node));
    }
    
    VBLinkedListSetCount(list, VBLinkedListGetCount(list) - 1);
}

