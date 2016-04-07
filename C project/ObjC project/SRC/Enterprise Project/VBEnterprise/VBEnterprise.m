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
@property (nonatomic, retain) NSMutableArray    *staff;
@property (nonatomic, retain) VBDispatcher      *washersDispatcher;
@property (nonatomic, retain) VBDispatcher      *accountansDispatcher;
@property (nonatomic, retain) VBDispatcher      *directorsDispatcher;

- (void)hireStaff;
- (void)dismissStaff;
- (void)dismissEmployee:(VBEmployee *)object;

@end

@implementation VBEnterprise

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self dismissStaff];
    self.staff = nil;
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

- (void)hireStaff {

    NSArray *director = [VBDirector objectsWithCount:kVBDirectorsCount observer:self];
    self.directorsDispatcher = [[[VBDispatcher alloc] initWithStaff:director] autorelease];
    
    NSArray *accountants = [VBAccountant objectsWithCount:kVBAccountantsCount observer:self];
    self.accountansDispatcher = [[[VBDispatcher alloc] initWithStaff:accountants] autorelease];
    
    NSArray *washers = [VBCarWasher objectsWithCount:kVBWashersCount observer:self];
    self.washersDispatcher = [[[VBDispatcher alloc] initWithStaff:washers] autorelease];
    
    self.staff = [NSMutableArray array];
    [self.staff addObjectsFromArray:director];
    [self.staff addObjectsFromArray:accountants];
    [self.staff addObjectsFromArray:washers];
}

- (void)dismissStaff {
    @synchronized(self) {
        NSMutableArray *staff = [[self.staff copy] autorelease];
        for (VBEmployee *employee in staff) {
            [self dismissEmployee:employee];
        }
        
        [self.staff removeAllObjects];
    }
}

- (void)dismissEmployee:(VBEmployee *)object {
    @synchronized(self) {
        for (VBEmployee *employee in self.staff) {
            if ([employee observedByObject:object]) {
                [employee removeObserver:object];
            }
            
            [self.staff removeObject:object];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car {
    @synchronized(self) {
        [self.washersDispatcher addObject:car];
    }
}

#pragma mark -
#pragma mark VBObserverProtocol

- (void)employeeBecameStandby:(id)employee {
    if ([self.washersDispatcher containsEmployee:employee]) {
        [self.accountansDispatcher addObject:employee];
    }

    if ([self.accountansDispatcher containsEmployee:employee]) {
        [self.directorsDispatcher addObject:employee];
    }
}

@end
