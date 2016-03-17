//
//  VBDirector.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDirector.h"

@implementation VBDirector

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id)object {
    [super performWorkWithObject:object];
    
    NSLog(@"Director's money = %lu", self.money);
}

#pragma mark -
#pragma mark Private

- (void)expectingFurtherObjectives {
    self.state = kVBEmployeeFreeState;
}

@end
