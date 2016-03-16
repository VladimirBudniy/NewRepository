//
//  VBAccountant.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAccountant.h"

@implementation VBAccountant

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id)object {
    object = self.object;
    [super performWorkWithObject:object];
}

@end
