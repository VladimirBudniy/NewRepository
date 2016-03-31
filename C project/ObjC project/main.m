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

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        VBCar *car = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        VBCar *car1 = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        VBCar *car2 = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        NSArray *carsArray = @[car, car1, car2];

        VBEnterprise *enterprise = [VBEnterprise object];
        
        for (NSUInteger index = 0; index < carsArray.count; index++) {
            [enterprise washCar:carsArray[index]];
        }
    }

    return 0;
}
