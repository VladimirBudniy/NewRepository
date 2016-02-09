//
//  VBLinkedListEnumerator.h
//  C project
//
//  Created by Vladimir Budniy on 09.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBLinkedListEnumerator_h
#define VBLinkedListEnumerator_h

#include <stdio.h>

#include "VBObject.h"
#include "VBLinkedList.h"
#include "VBLinkedListNode.h"

typedef struct VBLinkedListEnumerator VBLinkedListEnumerator;

struct VBLinkedListEnumerator {
    VBObject _super;
    VBLinkedList *_list;
    VBLinkedListNode *_node;
    uint64_t _mutationCount;
};

extern
VBLinkedListEnumerator *VBLinkedListEnumeratorCreateWithList(VBLinkedList *list);

extern
void __VBLinkedListEnumeratorDeallocate(VBLinkedListEnumerator *enumerator);

extern
VBLinkedListNode *VBLinkedListEnumeratorGetNextNode(VBLinkedListEnumerator *enumerator);

extern
bool VBLinkedListEnumeratorIsValid(VBLinkedListEnumerator *enumerator);


#endif /* VBLinkedListEnumerator_h */
