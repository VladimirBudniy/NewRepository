//
//  main.m
//  ObjC project
//
//  Created by Vladimir Budniy on 17.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBHumanClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *name = @"Vasya";
        NSUInteger age = 30;
        NSUInteger weight = 80;
        
        VBHuman *human = [VBHuman createHumanWithName:name age:age weight:weight gender:kVBMaleGenderType];
        [human sayHi];
        
        NSLog(@"The human name is %@, age %lu, weigth %lu, gender %d",name, (unsigned long)age, (unsigned long)weight, kVBMaleGenderType);
    }
    return 0;
}
