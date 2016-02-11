//
//  VBLinkedListPrivate.h
//  C project
//
//  Created by Vladimir Budniy on 11.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBLinkedListPrivate_h
#define VBLinkedListPrivate_h

typedef struct VBLinkedList VBLinkedList;

extern
uint64_t VBLinkedListGetMutaitonsCount(VBLinkedList *list);

extern
VBLinkedListNode *VBLinkedListGetHead(VBLinkedList *list);

#endif /* VBLinkedListPrivate_h */
