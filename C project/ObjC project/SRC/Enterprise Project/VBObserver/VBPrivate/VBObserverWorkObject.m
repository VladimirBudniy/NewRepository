//
//  VBObserverWorkObject.m
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserverWorkObject.h"

@implementation VBObserverWorkObject

#pragma mark -
#pragma mark Class Methods

+ (VBObserverWorkObject *)objectWithState:(NSUInteger *)state array:(VBObserverArray *)objectsArray {
    return [[VBObserverWorkObject alloc] initWithState:state array:objectsArray];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithState:(NSUInteger *)state array:(VBObserverArray *)array {
    self = [super init];
    if (self) {
        self.state = nil;
        self.observerArray = [VBObserverArray object];
    }
    
    return self;
}

@end

