//
//  VBEssenceTest.m
//  C project
//
//  Created by Vladimir Budniy on 19.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssenceTest.h"

@implementation VBEssenceTest

+(void)aMethod {
    for(NSUInteger index = 0; index < 10; index++) {
        printf("Object Thread says index is %lu\n",index);
        usleep(1);
    }
}

// v main

//        [NSThread detachNewThreadSelector:@selector(aMethod) toTarget:[VBEssenceTest class] withObject:nil];

//        for(NSUInteger index = 0; index < 10; index++) {
//            printf("Main thread says index is %lu\n",index);
//            usleep(1);
//        }


@end
