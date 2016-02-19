//
//  VBEssenceTest.m
//  C project
//
//  Created by Vladimir Budniy on 19.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEssenceTest.h"

@interface VBEssenceTest ()
- (void)performFirstTest;

@end

@implementation VBEssenceTest

#pragma mark -
#pragma mark Class Methods

+(void)performTesting {
    VBEssenceTest *man1 = [[[VBEssenceTest alloc]init]autorelease];
    VBEssenceTest *man2 = [[[VBEssenceTest alloc]init]autorelease];
    
    [man1 performFirstTest];
    [man1 addChild:man2];
}

- (void)performFirstTest {
   
}

@end
