//
//  VBDispatch.h
//  C project
//
//  Created by Vladimir Budniy on 18.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBEmployeeHandler)(void);

typedef enum {
    kVBDispatchPriorityHigh,
    kVBDispatchPriorityLow,
    kVBDispatchPriorityBackground,
    KVBDispatchPriorityDefault,
    kVBDispatchPriorityMain,
} VBDispatchPriorityType;

extern
void VBDispatchAsyncWithPriority(VBDispatchPriorityType priority, VBEmployeeHandler handler);
extern
void VBDispatchSyncWithPriority(VBDispatchPriorityType priority, VBEmployeeHandler handler);

extern
void VBDispatchAsyncInBackground(VBEmployeeHandler handler);
extern
void VBDispatchAsyncOnMainThread(VBEmployeeHandler handler);

extern
void VBDispatchSyncInBackground(VBEmployeeHandler handler);
extern
void VBDispatchSyncOnMainThread(VBEmployeeHandler handler);


