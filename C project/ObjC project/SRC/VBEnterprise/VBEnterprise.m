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
@property (nonatomic, retain) NSMutableArray *staff;

- (void)hireStaff;
- (void)firedStaff;
- (id)vacantEmployee:(Class)class;

@end

@implementation VBEnterprise

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self firedStaff];
    self.staff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self hireStaff];
    }
    
    return  self;
}

#pragma mark -
#pragma mark Private

- (void)hireStaff {
    VBCarWasher *washer = [VBCarWasher object];
    VBAccountant *accountant = [VBAccountant object];
    VBDirector *director = [VBDirector object];

    washer.delegate = accountant;
    accountant.delegate = director;
    
    self.staff = [@[washer, accountant, director] mutableCopy];
}

- (void)firedStaff {
    [self.staff removeAllObjects];
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
