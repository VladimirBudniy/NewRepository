//
//  VBEssence.m
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssence.h"

@interface VBEssence ()
@property (nonatomic, copy)     NSString        *essenceName;
@property (nonatomic, assign)   NSUInteger      essenceAge;
@property (nonatomic, assign)   CGFloat         essenceWeight;
@property (nonatomic, assign)   VBGenderType    genderType;
@property (nonatomic, retain)   NSMutableArray  *childrenArray;

@end

//@interface VBEssence ()
//
//- (void)addChild:(id)child;
//
//@end

@implementation VBEssence

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.essenceName = name;
        self.childrenArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Class Methods

+ (id)essenceWithName:(NSString *)name
                  age:(NSUInteger)age
               weight:(NSUInteger)weight
               gender:(VBGenderType)gender
{
    VBEssence *essence = [[[self alloc]initWithName:name]autorelease];
    essence.essenceAge = age;
    essence.essenceWeight = weight;
    essence.genderType = kVBMaleGenderType;
    
    return essence;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [self.childrenArray copy];
}

#pragma mark -
#pragma mark Private

- (void)sayHi {
    NSLog(@"human say Hi!");
}

- (void)addChild:(id)child {
    [self.childrenArray addObject:child];
}

- (void)removeChild:(id)child {
    [self.childrenArray removeObject:child];
}

- (void)removeChildren {
    [self.childrenArray removeAllObjects];
}

- (NSUInteger)arrayCount {
    NSUInteger count = [self.childrenArray count];
    return count;
}

@end
