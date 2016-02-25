//
//  VBEssence.m
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssence.h"

@interface VBEssence ()
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, retain)   NSMutableArray  *childrenArray;
@property (nonatomic, assign)   NSUInteger      age;
@property (nonatomic, assign)   CGFloat         essenceWeight;

@end

@implementation VBEssence

#pragma mark -
#pragma mark Class Methods

+ (id)essenceWithName:(NSString *)name
                  age:(NSUInteger)age
               weight:(NSUInteger)weight
{
    VBEssence *essence = [[[self alloc]initWithName:name] autorelease];
    essence.age = age;
    essence.essenceWeight = weight;
    
    return essence;
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void) dealloc {
    self.name = nil;
    self.childrenArray = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.childrenArray = [NSMutableArray array];
    
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [self init];
    if (self) {
        self.name = name;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [self.childrenArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addChild:(id)child {
    [self.childrenArray addObject:child];
}

- (void)removeChild:(id)child {
    [self.childrenArray removeObject:child];
}

- (void)removeChildren {
    [self.childrenArray removeAllObjects];
}

- (void)sayHi {
    NSLog(@"%@ say Hi!", self.name);
    for (VBEssence *object in self.childrenArray) {
        [object sayHi];
    }
}

- (void)performGenderSpecificOperation {
    
}

@end
