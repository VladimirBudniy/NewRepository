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
@property (nonatomic, assign) VBCar          *car;

- (void)hireStaff;
- (void)fireStaff;
- (id)vacantEmployee:(Class)class;

@end

@implementation VBEnterprise

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self fireStaff];
    self.staff = nil;
    self.car = nil;
    
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
#pragma mark Accessors

- (void)setCar:(VBCar *)car {  // for VBCarClass
    if (_car != car) {
        [_car removeObserver:self];
        _car = car;
        [car addObserver:self];
    }
}

#pragma mark -
#pragma mark Private

- (void)hireStaff {
    VBCarWasher *washer = [[[VBCarWasher alloc] initWithState:kVBEmployeeFreeState] autorelease];
    VBAccountant *accountant = [[[VBAccountant alloc] initWithState:kVBEmployeeFreeState] autorelease];
    VBDirector *director = [[[VBDirector alloc] initWithState:kVBEmployeeFreeState] autorelease];
    
    [washer addObserver:accountant];
    [accountant addObserver:director];
    
    accountant.object = washer;
    director.object = accountant;
    
    self.staff = [@[washer, accountant, director] mutableCopy];
}

- (void)fireStaff {
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
    [self setCar:car];
    VBCarWasher *washer = [self vacantEmployee:[VBCarWasher class]];
    [washer performWorkWithObjectIfNeeded:car];
}

#pragma mark -
#pragma mark VBObserverProtocol

// for VBCarClass

- (void)carWashed {
    NSLog(@"Your car is clean");
}

- (void)carSolied {
    NSLog(@"Your car is solied");
}

@end
