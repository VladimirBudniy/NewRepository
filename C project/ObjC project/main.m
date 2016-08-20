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

#import "VBDelegateTest.h"

//static NSUInteger const kVBCarsArrayCount = 18;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSArray *carsArray = [VBCar objectsWithCount:kVBCarsArrayCount];
//        VBEnterprise *enterprise = [[[VBEnterprise alloc] init] autorelease];
//        
//        for (NSUInteger index = 0; index < carsArray.count; index++) {
//            [enterprise washCar:carsArray[index]];
//        }
//        
//        NSRunLoop *loop = [NSRunLoop mainRunLoop];
//        [loop run];
        
        VBDelegateTest *delegate = [[VBDelegateTest new] autorelease]; //controller
        VBDelegatingObject *delegatingObject = [[VBDelegatingObject new] autorelease]; //model
        
        delegatingObject.name = @"Vasya";
        delegatingObject.delegate = delegate;
        
        [delegate sayMama:delegatingObject];
        
        if ([delegate respondsToSelector:@selector(sayPapa:)]) {
            [delegate sayPapa:delegatingObject];
        }
        
    }

    return 0;
}
