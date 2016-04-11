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

#import "VBQueue.h"
#import "VBDispatcher.h"

static NSUInteger const kVBWashersCount     = 3;
static NSUInteger const kVBAccountantsCount = 2;
static NSUInteger const kVBDirectorsCount   = 1;

@interface VBEnterprise ()
@property (nonatomic, retain) VBDispatcher      *washersDispatcher;
@property (nonatomic, retain) VBDispatcher      *accountansDispatcher;
@property (nonatomic, retain) VBDispatcher      *directorsDispatcher;

- (void)hireStaff;
- (void)addHandlerForStandbyState:(NSArray *)staff;

@end

@implementation VBEnterprise

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.washersDispatcher = nil;
    self.accountansDispatcher = nil;
    self.directorsDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)addHandlerForStandbyState:(NSArray *)staff {
    @synchronized(self) {
        for (VBEmployee *employee in staff) {
            [employee addHandler:^{
                [self employeeBecameStandby:employee];
            } ForState:kVBEmployeeStandbyState];
            
            [employee addHandler:^{
                NSLog(@"TEST HANDLER 1");
            } ForState:kVBEmployeeStandbyState];
            
            [employee addHandler:^{
                NSLog(@"TEST HANDLER 2");
            } ForState:kVBEmployeeStandbyState];
        }
    }
}

- (void)employeeBecameStandby:(id)employee {
    if ([self.washersDispatcher containsEmployee:employee]) {
        [self.accountansDispatcher addObject:employee];
    } else if ([self.accountansDispatcher containsEmployee:employee]) {
        [self.directorsDispatcher addObject:employee];
    }
}

- (void)hireStaff {
    
    NSArray *director = [VBDirector objectsWithCount:kVBDirectorsCount];
    NSArray *accountants = [VBAccountant objectsWithCount:kVBAccountantsCount];
    NSArray *washers = [VBCarWasher objectsWithCount:kVBWashersCount];
    
    self.washersDispatcher = [[[VBDispatcher alloc] initWithStaff:washers] autorelease];
    self.accountansDispatcher = [[[VBDispatcher alloc] initWithStaff:accountants] autorelease];
    self.directorsDispatcher = [[[VBDispatcher alloc] initWithStaff:director] autorelease];
    
    [self addHandlerForStandbyState:washers];
    [self addHandlerForStandbyState:accountants];
}

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car {
    @synchronized(self) {
        [self.washersDispatcher addObject:car];
    }
}

@end
