//
//  VBDelegateTest.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDelegateTest.h"

@implementation VBDelegateTest

- (void)sayMama:(VBDelegatingObject *)object {
    NSLog(@"%@ asked me say Mama, if I can!", object.name);
}

- (void)sayPapa:(VBDelegatingObject *)object {
    NSLog(@"%@ asked me say Papa, if I can!", object.name);
}

@end
