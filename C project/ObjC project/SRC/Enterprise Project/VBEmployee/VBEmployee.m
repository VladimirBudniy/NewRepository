//
//  VBEmployee.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEmployee.h"
#import "VBAccountant.h"
#import "VBCarWasher.h"
#import "VBDirector.h"

static const char VBGCDQueue[] = "VBGCDQueue";

@interface VBEmployee ()
@property (nonatomic, retain) dispatch_queue_t queue;

- (void)completeWorkWithObject:(id)object;
- (void)completeWork;
- (void)workWithObject:(id)object;

- (dispatch_queue_t)gcdQueue;

@end

@implementation VBEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBEmployeeFreeState;
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [self init];
    if (self) {
        self.state = state;
        self.money = 0;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    if (object) {
        [self gcdQueue];
        self.state = kVBEmployeeBusyState;
        
        dispatch_async(self.queue, ^{
            @synchronized(self) {
                usleep(arc4random_uniform(100) + 10);
                [self workWithObject:object];
                //        NSLog(@"%@ take money %lu", self, self.money);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self completeWork];
                });
            }
        });
    }
}

#pragma mark -
#pragma mark Private

- (dispatch_queue_t)gcdQueue {
    dispatch_queue_t queue = dispatch_queue_create(VBGCDQueue, DISPATCH_QUEUE_SERIAL);
    self.queue = queue;
    dispatch_release(queue); 
    
    return self.queue;
}

- (void)workWithObject:(id<VBMoneyProtocol>)object {
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
}

- (void)completeWorkWithObject:(VBEmployee *)employee {
    employee.state = kVBEmployeeFreeState;
}

- (void)completeWork {
    self.state = kVBEmployeeStandbyState;
}

#pragma mark -
#pragma mark VBMoneyProtocol

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger payment = self.money;
        self.money = 0;
        
        return payment;
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money += money;
    }
}

@end
