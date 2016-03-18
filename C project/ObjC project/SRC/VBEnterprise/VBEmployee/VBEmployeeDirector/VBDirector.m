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
#pragma mark Private

- (void)completeWork {
    NSLog(@"Director's money = %lu", self.money);
    self.state = kVBEmployeeFreeState;
}

@end
