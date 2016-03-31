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

static NSUInteger const kVBWashersCount = 3;

@interface VBEnterprise ()
@property (nonatomic, retain) NSMutableArray *staff;
@property (nonatomic, retain) NSMutableArray *cars;

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
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cars = [NSMutableArray array];
        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)hireStaff {
    
    VBAccountant *accountant = [VBAccountant object];
    VBDirector *director = [VBDirector object];
    [accountant addObserver:director];
    
    self.staff = [NSMutableArray arrayWithObjects:accountant, director, nil];
    
    NSArray *washers = [NSObject objectsWithClass:[VBCarWasher class] count:kVBWashersCount];
    for (VBCarWasher *washer in washers) {
        [washer addObserver:accountant];
        [washer addObserver:self];
        
        [self.staff addObject:washer];
    }
    
}

- (void)dismissStaff {
    NSMutableArray *staff = [[self.staff copy] autorelease];
    for (VBEmployee *employee in staff) {
        [self dismissEmployee:employee];
    }
    
    [self.staff removeAllObjects];
}

- (void)dismissEmployee:(VBEmployee *)object {
    for (VBEmployee *employee in self.staff) {
        if ([employee observedByObject:object]) {
            [employee removeObserver:object];
        }
    }
    
    [self.staff removeObject:object];
}

- (id)vacantEmployee:(Class)class {
    for (VBEmployee *employee in self.staff) {
        if (([employee isMemberOfClass:class]) && (employee.state == kVBEmployeeFreeState)) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car {
    [self.cars addObject:car];
    
    @synchronized(self.staff) {
        VBCarWasher *washer = [self vacantEmployee:[VBCarWasher class]];
        @synchronized(self.cars) {
            VBCar *car = [self.cars lastObject];
            if (car) {
                [self.cars removeObject:car];
            }
            
            [washer performWorkWithObject:car];
        }
    }
}

//#pragma mark -
//#pragma mark VBObserverProtocol
//
//- (void)employeeBecameFree:(VBCarWasher *)washer {
//    
//}

@end
