//
//  NSObject+VBCategory.m
//  C project
//
//  Created by Vladimir Budniy on 23.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSObject+VBCategory.h"

@implementation NSObject (VBCategory)

#pragma mark -
#pragma mark Initializations and Deallocatins

+ (instancetype)object {
    return [[[[self class] alloc] init] autorelease];
}

@end
