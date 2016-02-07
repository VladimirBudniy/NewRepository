//
//  VBLinkedList.h
//  C project
//
//  Created by Vladimir Budniy on 06.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBLinkedList_h
#define VBLinkedList_h

#include <stdbool.h>

#include "VBObject.h"
#include "VBLinkedListNode.h"

typedef struct VBLinkedList VBLinkedList;

struct VBLinkedList {
    VBObject _super;
    VBLinkedListNode *_head;
    uint64_t _count;
};

extern
VBLinkedList *VBLinkedlistCreate(void);

extern
VBLinkedList *VBLinkedListGetObject(void *object);

extern
void *VBLinkedListAddObject(VBLinkedList *list, void *object);

extern
void *VBLinkedListRemoveObject(VBLinkedList *list, void *object);

extern
void *VBLinkedListRemoveAllObjects(VBLinkedList *list, uint64_t count);

extern
uint64_t VBLinkedListGetCount(VBLinkedList *list);

#endif /* VBLinkedList_h */
