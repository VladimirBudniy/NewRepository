//
//  VBDispatcher.m
//  C project
//
//  Created by Vladimir Budniy on 07.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDispatcher.h"
#import "VBQueue.h"

@interface VBDispatcher ()
@property (nonatomic, retain) NSMutableArray *staff;
@property (nonatomic, retain) VBQueue        *queue;

- (VBEmployee *)vacantEmployee;
- (void)workWithObject:(id)objedt;
- (void)employeeBecameFree:(id)employee;

@end

@implementation VBDispatcher

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.staff = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.staff = nil;
        self.queue = nil;
    }
    
    return self;
}

- (instancetype)initWithStaff:(NSArray *)staff {
    self = [self init];
    if (self) {
        self.staff = [[staff mutableCopy] autorelease];
        self.queue = [VBQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setStaff:(NSMutableArray *)staff {
    if (_staff != staff) {
        _staff = staff;
        
        for (VBEmployee *employee in staff) {
            VBWeakSelfMacro;
            [employee addHandler:^{
                VBStrongSelfAndReturnNilMacro;
                [self employeeBecameFree:employee];
            } forState:kVBEmployeeFreeState object:self];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    [self workWithObject:object];
}

- (BOOL)containsEmployee:(VBEmployee *)employee {
    return [self.staff containsObject:employee];
}

#pragma mark -
#pragma mark Private

- (VBEmployee *)vacantEmployee {
    @synchronized(self) {
        for (VBEmployee *employee in self.staff) {
            if (employee.state == kVBEmployeeFreeState) {
                return employee;
            }
        }
    }
    
    return nil;
}

- (void)workWithObject:(id)object {
    [self.queue pushObject:object];
    VBEmployee *employee = [self vacantEmployee];
    if (employee && object) {
        [employee performWorkWithObject:[self.queue popObject]];
    }
}

- (void)employeeBecameFree:(id)employee {
    [self workWithObject:[self.queue popObject]];
}

@end
