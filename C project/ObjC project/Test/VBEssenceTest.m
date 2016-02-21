//
//  VBEssenceTest.m
//  C project
//
//  Created by Vladimir Budniy on 19.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssenceTest.h"

@interface VBEssenceTest ()
+ (void)performFirstTest;
+ (void)performSecondTest;

@end

@implementation VBEssenceTest

#pragma mark -
#pragma mark Class Methods

+ (void)performTesting {
    [VBEssenceTest performFirstTest];
    [VBEssenceTest performSecondTest];
}

+ (void)performFirstTest {
    @autoreleasepool {
        
        VBEssence *human = [VBEssence essenceWithName:@"Human" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *man = [VBEssence essenceWithName:@"Vasya" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *woman = [VBEssence essenceWithName:@"Lena" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child1 = [VBEssence essenceWithName:@"child1" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child2 = [VBEssence essenceWithName:@"child2" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child3 = [VBEssence essenceWithName:@"child3" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child4 = [VBEssence essenceWithName:@"child4" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child5 = [VBEssence essenceWithName:@"child5" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child6 = [VBEssence essenceWithName:@"child6" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child7 = [VBEssence essenceWithName:@"child7" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child8 = [VBEssence essenceWithName:@"child8" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child9 = [VBEssence essenceWithName:@"child9" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child10 = [VBEssence essenceWithName:@"child10" age:2 weight:11.4 gender:kVBFemaleGenderType];
        
        
        [man addChild:child1];
        [man addChild:child2];
        [man addChild:child3];
        [man addChild:child4];
        [man addChild:child5];
        [man addChild:child6];
        
        [woman addChild:child7];
        [woman addChild:child8];
        [woman addChild:child9];
        [woman addChild:child10];
        
        [human addChild:man];
        [human addChild:woman];
        
        NSLog(@"\n\nThe test for addition children\n");
        
        NSUInteger countM = [man arrayCount];
        NSLog(@"The man array count = %lu", countM);

        NSUInteger countW = [woman arrayCount];
        NSLog(@"The women array count = %lu", countW);
        
        NSUInteger countH = [human arrayCount];
        NSLog(@"The human array count = %lu", countH);
        
        NSLog(@"\n\nThe test on skills\n");
        [man checkSkillsObjects];
        [woman checkSkillsObjects];
        [human checkSkillsObjects];
        
        NSLog(@"\n\nThe test for Say Hi! \n");
        [man sayHi];
        
        NSLog(@"\n\nThe test for removing child\n");
        
        [man removeChild:child3];
        [woman removeChild:child7];
        
        NSUInteger countM1 = [man arrayCount];
        NSLog(@"The array count = %lu", countM1);
        
        NSUInteger countW1 = [woman arrayCount];
        NSLog(@"The woman array count = %lu", countW1);
        
        NSUInteger countH1 = [human arrayCount];
        NSLog(@"The human array count = %lu", countH1);
        
        NSLog(@"\n\nThe test for removing children\n");
        
        [man removeChildren];
        [woman removeChildren];
        [human removeChildren];
        
        NSUInteger countM2 = [man arrayCount];
        NSLog(@"The man array count = %lu", countM2);
        
        NSUInteger countW2 = [woman arrayCount];
        NSLog(@"The woman array count = %lu", countW2);
        
        NSUInteger countH2 = [human arrayCount];
        NSLog(@"The human array count = %lu", countH2);
        
    }
}

+ (void)performSecondTest {
    @autoreleasepool {
       
    }
}

@end
