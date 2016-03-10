//
//  VBEnterprise.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEnterprise.h"
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

@synthesize delegate = _delegate;

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
    self.delegate = washer;
    VBAccountant *accountant = [VBAccountant object];
    washer.delegate = accountant;
    VBDirector *director = [VBDirector object];
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

- (void)toWashCar:(VBCar *)car {
    VBCarWasher *washer = [self vacantEmployee:[VBCarWasher class]];
    [washer washCar:car];
    VBAccountant *accountant = [self vacantEmployee:[VBAccountant class]];
    [accountant countMoney:washer];
    VBDirector *director = [self vacantEmployee:[VBDirector class]];
    [director receivedProfit:accountant];
}

@end
