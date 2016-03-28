//
//  VBEnterprise.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEnterprise.h"
#import "VBEmployee.h"
#import "VBCarWasher.h"
#import "VBAccountant.h"
#import "VBDirector.h"

@interface VBEnterprise ()
@property (nonatomic, assign) NSMutableArray *staff;

- (void)hireStaff;
- (void)dismissStaff;
- (void)dismissEmployee:(VBEmployee *)object;
- (id)vacantEmployee:(Class)class;

@end

@implementation VBEnterprise

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self dismissStaff];
    self.staff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.staff = nil;
        [self hireStaff];
    }
    
    return  self;
}

#pragma mark -
#pragma mark Private

- (void)hireStaff {
    VBCarWasher *washer = [[VBCarWasher new]  autorelease];
    VBAccountant *accountant = [[VBAccountant new]  autorelease];
    VBDirector *director = [[[VBDirector alloc] initWithState:kVBEmployeeFreeState] autorelease];
    
    [washer addBlockForState:^{
        [accountant performWorkWithObject:washer];
    } state:kVBEmployeeStandbyState];

//    [washer addObserver:accountant];
    [accountant addObserver:director];
    
    self.staff = [[@[washer, accountant, director] mutableCopy] autorelease];
    
//    [self dismissStaff]; for test
}

- (void)dismissStaff {
    NSMutableArray *staff = [[self.staff copy] autorelease];
    for (VBEmployee *employee in staff) {
        [self dismissEmployee:employee];
    }
    
    [self.staff removeAllObjects];
}

- (void)dismissEmployee:(VBEmployee *)object {
    for (NSUInteger index = 0; index < self.staff.count; index++) {
        VBEmployee *employee = self.staff[index];
        if ([object observedObject:employee]) {
            [object removeObserver:employee];
            [object.stateBlock removeAllObjects];
        }
    }
    
    [self.staff removeObject:object];
}

- (id)vacantEmployee:(Class)class {
    for (VBEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class]) {
            return employee;
        }
    }
    
    return  nil;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car {
    VBCarWasher *washer = [self vacantEmployee:[VBCarWasher class]];
    [washer performWorkWithObject:car];
}

@end
