//
//  main.m
//  ObjC project
//
//  Created by Vladimir Budniy on 17.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBEssence.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        VBEssence *man = [VBEssence essenceWithName:@"Vasya" age:30 weight:85.5 gender:kVBMaleGenderType];
//        VBEssence *woman = [VBEssence essenceWithName:@"Lena" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child1 = [VBEssence essenceWithName:@"child1" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child2 = [VBEssence essenceWithName:@"child2" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child3 = [VBEssence essenceWithName:@"child3" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child4 = [VBEssence essenceWithName:@"child4" age:2 weight:11.4 gender:kVBFemaleGenderType];
        VBEssence *child5 = [VBEssence essenceWithName:@"child5" age:30 weight:85.5 gender:kVBMaleGenderType];
        VBEssence *child6 = [VBEssence essenceWithName:@"child6" age:2 weight:11.4 gender:kVBFemaleGenderType];
        
        [man addChild:child1];
        [man addChild:child2];
        [man addChild:child3];
        [man addChild:child4];
        [man addChild:child5];
        [man addChild:child6];
        
        
        NSUInteger count = [man arrayCount];
         NSLog(@"The array count = %lu", count);
        
        [man removeChild:child3];
        
        NSUInteger count1 = [man arrayCount];
        NSLog(@"The array count = %lu", count1);
    
        [man removeChildren];
        
        NSUInteger count2 = [man arrayCount];
        NSLog(@"The array count = %lu", count2);
        
    }
    return 0;
}
