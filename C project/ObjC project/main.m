//
//  main.m
//  ObjC project
//
//  Created by Vladimir Budniy on 17.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBCar.h"
#import "VBEnterprise.h"
#import "VBEmployee.h"
#import "VBEssenceTest.h"


static NSUInteger const kVBCarsArrayCount = 15;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *carsArray = [VBCar objectsWithCount:kVBCarsArrayCount];
        VBEnterprise *enterprise = [[[VBEnterprise alloc] init] autorelease];
        
        for (NSUInteger index = 0; index < carsArray.count; index++) {
            [enterprise washCar:carsArray[index]];
        }
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }

    return 0;
}
