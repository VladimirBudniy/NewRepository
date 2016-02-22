//
//  VBFemale.m
//  C project
//
//  Created by Vladimir Budniy on 22.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFemale.h"

@interface VBFemale ();

- (VBFemale *)giveBirthChild;

@end

@implementation VBFemale
- (VBFemale *)giveBirthChild {
    VBFemale *child = [[VBFemale new] autorelease];
    NSLog(@"She can give birth child");
    
    return child;
}

- (void)performGenderSpecificOperation {
    [self giveBirthChild];
}

@end
