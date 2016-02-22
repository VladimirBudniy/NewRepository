//
//  NSObject+VBEssenceCategory.m
//  C project
//
//  Created by Vladimir Budniy on 23.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSObject+VBEssenceCategory.h"

@implementation NSObject (VBEssenceCategory)

+ (instancetype)createObject {
    return [[[NSObject alloc]init] autorelease];
}

@end
