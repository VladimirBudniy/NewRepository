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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        VBCar *car = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        VBCar *car1 = [[[VBCar alloc] initWithState:kVBCarCleanState money:50] autorelease];
        VBCar *car2 = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        VBCar *car3 = [[[VBCar alloc] initWithState:kVBCarCleanState money:50] autorelease];
        VBCar *car4 = [[[VBCar alloc] initWithState:kVBCarDirtyState money:100] autorelease];
        
        NSArray *carsArray = @[car, car1, car2, car3, car4];

        VBEnterprise *enterprise = [[[VBEnterprise alloc] init] autorelease];
        for (NSUInteger index = 0; index < carsArray.count; index++) {
            [enterprise washCar:carsArray[index]];
        }
    }
    
    return 0;
}
