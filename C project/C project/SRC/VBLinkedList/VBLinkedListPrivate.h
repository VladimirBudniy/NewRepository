//
//  VBLinkedListPrivate.h
//  C project
//
//  Created by Vladimir Budniy on 11.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBLinkedListPrivate_h
#define VBLinkedListPrivate_h

typedef struct {
    void *_object;
    void *_previosNode;
    void *_node;
} VBLinkedListContext;



extern
uint64_t VBLinkedListGetMutationsCount(VBLinkedList *list);

extern
VBLinkedListNode *VBLinkedListGetHead(VBLinkedList *list);

#endif /* VBLinkedListPrivate_h */
