//
//  VBMale.m
//  C project
//
//  Created by Vladimir Budniy on 22.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBMale.h"

@interface VBMale ();

- (void)mustGoFight;

@end

@implementation VBMale

#pragma mark -
#pragma mark Public Methods

- (void)mustGoFight {
    NSLog(@"He must will go to fight");
}

- (void)performGenderSpecificOperation {
    [self mustGoFight];
}

@end
