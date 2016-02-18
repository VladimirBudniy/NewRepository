//
//  VBHumanClass.m
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBHumanClass.h"

@implementation VBHuman

@synthesize humanName;
@synthesize humanAge;
@synthesize humanWeight;
@synthesize children;
@synthesize genderType;

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.humanName = name;
    }
    
    return self;
}

//- (BOOL)ableToBirth:(VBObjectGenderType)genderType;
//- (BOOL)ableToFight:(VBObjectGenderType)genderType;
//- (void)addChild;
//- (void)removeChild;
//- (void)removeChildren;

- (void)sayHi {
    NSLog(@"human say Hi!");
}

+ (id)createHumanWithName:(NSString *)name age:(NSUInteger)age
                   weight:(NSUInteger)weight gender:(VBObjectGenderType)gender
{
    VBHuman *human = [[[self alloc]initWithName:name]autorelease];
    human.humanAge = age;
    human.humanWeight = weight;
    human.genderType = kVBMaleGenderType;
    
    return human;
}

@end
