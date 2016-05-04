//
//  UIWindow+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 04.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIWindow+VBCategory.h"

@implementation UIWindow (VBCategory)

+ (instancetype)newWindow {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
