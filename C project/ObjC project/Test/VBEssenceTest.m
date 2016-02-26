//
//  VBEssenceTest.m
//  C project
//
//  Created by Vladimir Budniy on 19.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssenceTest.h"
#import "VBFemale.h"
#import "VBMale.h"
#import "NSObject+VBCategory.h"

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
    [VBEssenceTest performStringTest];
}

+ (void)performFirstTest {
//
//        VBEssence *human = [VBEssence essenceWithName:@"Human" age:30 weight:85.5];
//        VBEssence *man = [VBEssence essenceWithName:@"Vasya" age:30 weight:85.5];
//        VBEssence *woman = [VBEssence essenceWithName:@"Lena" age:2 weight:11.4];
//        
//        NSArray *newArray = @[human, man, woman];
//        
//        VBEssence *child1 = [VBEssence essenceWithName:@"child1" age:30 weight:85.5];
//        VBEssence *child2 = [VBEssence essenceWithName:@"child2" age:2 weight:11.4];
//        VBEssence *child3 = [VBEssence essenceWithName:@"child3" age:30 weight:85.5];
//        VBEssence *child4 = [VBEssence essenceWithName:@"child4" age:2 weight:11.4];
//        VBEssence *child5 = [VBEssence essenceWithName:@"child5" age:30 weight:85.5];
//        VBEssence *child6 = [VBEssence essenceWithName:@"child6" age:2 weight:11.4];
//        VBEssence *child7 = [VBEssence essenceWithName:@"child7" age:30 weight:85.5];
//        VBEssence *child8 = [VBEssence essenceWithName:@"child8" age:2 weight:11.4];
//        VBEssence *child9 = [VBEssence essenceWithName:@"child9" age:30 weight:85.5];
//        VBEssence *child10 = [VBEssence essenceWithName:@"child10" age:2 weight:11.4];
//        
//        
//        [man addChild:child1];
//        [man addChild:child2];
//        [man addChild:child3];
//        [man addChild:child4];
//        [man addChild:child5];
//        [man addChild:child6];
//        
//        [woman addChild:child7];
//        [woman addChild:child8];
//        [woman addChild:child9];
//        [woman addChild:child10];
//        
//        [human addChild:man];
//        [human addChild:woman];
//        
//        NSLog(@"\n\nThe test for addition children\n");
//        
//        NSUInteger countA = [newArray count];
//        NSLog(@"The man array count = %lu", countA);
//        
//        NSUInteger countM = [man.children count];
//        NSLog(@"The man array count = %lu", countM);
//
//        NSUInteger countW = [woman.children count];
//        NSLog(@"The women array count = %lu", countW);
//        
//        NSUInteger countH = [human.children count];
//        NSLog(@"The human array count = %lu", countH);
//        
//        NSLog(@"\n\nThe test on skills\n");
//        [man checkSkillsObjects];
//        [woman checkSkillsObjects];
//        [human checkSkillsObjects];
//        
//        NSLog(@"\n\nThe test for Say Hi! \n");
//        [man sayHi];
//        
//        NSLog(@"\n\nThe test for removing child\n");
//        
//        [man removeChild:child3];
//        [woman removeChild:child7];
//        
//        NSUInteger countM1 = [man.children count];
//        NSLog(@"The array count = %lu", countM1);
//        
//        NSUInteger countW1 = [woman.children count];
//        NSLog(@"The woman array count = %lu", countW1);
//        
//        NSUInteger countH1 = [human.children count];
//        NSLog(@"The human array count = %lu", countH1);
//        
//        NSLog(@"\n\nThe test for removing children\n");
//        
//        [man removeChildren];
//        [woman removeChildren];
//        [human removeChildren];
//        
//        NSUInteger countM2 = [man.children count];
//        NSLog(@"The man array count = %lu", countM2);
//        
//        NSUInteger countW2 = [woman.children count];
//        NSLog(@"The woman array count = %lu", countW2);
//        
//        NSUInteger countH2 = [human.children count];
//        NSLog(@"The human array count = %lu", countH2);
//
}

+ (void)performSecondTest {
//        VBFemale *womentest = [VBFemale createObject];
//        VBFemale *woman = [[[VBFemale alloc] initWithName:@"Lena"] autorelease];
//        VBMale *man = [[[VBMale alloc] initWithName:@"Kolya"] autorelease];
//        VBFemale *woman1 = [[[VBFemale alloc] initWithName:@"Sveta"] autorelease];
//        VBMale *man1 = [[[VBMale alloc] initWithName:@"Vasya"] autorelease];
//        VBMale *man2 = [[[VBMale alloc] initWithName:@"Tolya"] autorelease];
//        VBFemale *woman2 = [[[VBFemale alloc] initWithName:@"Tanya"] autorelease];
//        
//        NSArray *array = @[womentest, woman, man, man1, woman1, woman2, man2];
//        
//        for (id skills in array) {
//            [skills performGenderSpecificOperation];
//    }
}

+ (void)performStringTest {
//    NSString *string = [NSString randomString];
//    NSString *stringWithLenght = [NSString randomStringWithLength:10];
//    NSString *stringWithAlphabet = [NSString randomStringWithAlphabet:[NSString lowLettersAlphabet]];
//    NSString *stringWithLenghtAlphabet = [NSString randomStringWithLenght:5 alphabet:[NSString numericAlphabet]];
//    
//    NSString *stringHighAlphabet = [NSString highLettersAlphabet];
//    NSString *stringLowAlphabet = [NSString lowLettersAlphabet];
//    NSString *stringWithNumbers = [NSString numericAlphabet];
//    NSString *stringFullAlphabet = [NSString alphanumericAlphabet];
    NSString *alphabet = [NSString Alphabet];
    
//    NSLog(@"random string - %@", string);
//    NSLog(@"random string with lenght - %@", stringWithLenght);
//    NSLog(@"random string with alphabet - %@", stringWithAlphabet);
//    NSLog(@"random string with lenght and alphabet - %@", stringWithLenghtAlphabet);
//    NSLog(@"string with high alphabet - %@", stringHighAlphabet);
//    NSLog(@"string with low alphabet - %@", stringLowAlphabet);
//    NSLog(@"string with numbers - %@", stringWithNumbers);
//    NSLog(@"string with high, low and numbers alphabet - %@", stringFullAlphabet);
    NSLog(@"string alphabet - %@", alphabet);
}


@end
