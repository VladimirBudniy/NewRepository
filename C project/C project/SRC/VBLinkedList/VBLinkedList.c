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
void VBLinkedListSetFirstNode(VBLinkedList *list, VBLinkedListNode *node); //maybe is not void?

static
VBLinkedListNode *VBLinkedListGetFirstNode(VBLinkedList *list); // maybe is not void????

static
void VBLinkedListSetObject(VBLinkedList *list, void *object);

static
void VBLinkedListSetCount(VBLinkedList *list, uint64_t count);

static
bool VBLinkedListIsEmpty(VBLinkedList *list);

static
bool VBLinkedListContainsObject(VBLinkedList *list, void *object);

#pragma mark-
#pragma mark Initialization & Deallocation

void __VBLinkedListDeallocate(VBLinkedList *list) {
    VBLinkedListSetFirstNode(list, NULL);
    VBLinkedListSetObject(list, NULL);
    
    __VBObjectDeallocate(list);
}

VBLinkedList *VBLinkedlistCreate(void) {
    VBLinkedList *list = VBObjectCreate(VBLinkedList);
    
    return list;
}

#pragma mark-
#pragma mark Accessors

void VBLinkedListSetFirstNode(VBLinkedList *list, VBLinkedListNode *node) {
    VBReturnMacro(list);
    
    VBRetainMacro(list->_head, node);
}

VBLinkedListNode *VBLinkedListGetFirstNode(VBLinkedList *list) {
    return list->_head;
}

void VBLinkedListSetObject(VBLinkedList *list, void *object);

VBLinkedList *VBLinkedListGetObject(void *object);

void VBLinkedListSetCount(VBLinkedList *list, uint64_t count) {
    VBReturnMacro(list)
    
    VBAssignMacro(list->_count, count);
}

uint64_t VBLinkedListGetCount(VBLinkedList *list) {
    return  list->_count;
}

#pragma mark -
#pragma mark Private

bool VBLinkedListIsEmpty(VBLinkedList *list);

bool VBLinkedListContainsObject(VBLinkedList *list, void *object);


#pragma mark-
#pragma mark Public Implementations

void *VBLinkedListAddObject(VBLinkedList *list, void *object);

void *VBLinkedListRemoveObject(VBLinkedList *list, void *object);

void *VBLinkedListRemoveAllObjects(VBLinkedList *list, uint64_t count);

