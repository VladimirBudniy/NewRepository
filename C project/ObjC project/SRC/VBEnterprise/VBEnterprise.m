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
@property (nonatomic, assign) NSHashTable    *staff;
@property (nonatomic, assign) VBCar          *car;

- (void)hireStaff;
- (void)fireStaff;
- (id)vacantEmployee:(Class)class;
- (void)addObjects:(NSArray *)employee;

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
        self.staff = [NSHashTable weakObjectsHashTable];
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
    
    NSArray* employeeArray = @[washer, accountant, director];
    [self addObjects:employeeArray];
}

- (void)addObjects:(NSArray *)employee {
    for (NSUInteger index = 0; index < 3; index++) {
        [self.staff addObject:employee[index]];
    }
}

- (void)addObjects:(id)firstOsbject object:(id)secondObject object:(id)thirdObject {
    [self.staff addObject:firstOsbject];
    [self.staff addObject:secondObject];
    [self.staff addObject:thirdObject];
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

- (void)carWashed:(VBCar *)car {
    NSLog(@"Your car is clean");
}

- (void)carSolied:(VBCar *)car {
    NSLog(@"Your car is solied");
}

@end
