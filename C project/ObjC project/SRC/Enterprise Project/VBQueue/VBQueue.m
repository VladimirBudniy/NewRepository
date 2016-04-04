//
//  VBQueue.m
//  C project
//
//  Created by Vladimir Budniy on 04.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBQueue.h"

@interface VBQueue ()
@property (nonatomic, retain) NSMutableArray *queueArray;

@end

@implementation VBQueue


#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self.queueArray removeAllObjects];
    self.queueArray = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queueArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)queue {
    return [[self.queueArray copy] autorelease];
}

#pragma mark -
#pragma mark Public

-(void)pushObject:(id)object {
    @synchronized(self) {
        [self.queueArray addObject:object];
    }
}

-(id)popObject {
    @synchronized(self) {
        id object = [self.queueArray firstObject];
        if (object) {
            [self.queueArray removeObject:object];
        }
        
        return object;
    }
}

@end
