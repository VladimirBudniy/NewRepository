//
//  UIViewController+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 22.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIViewController+VBCategory.h"

@implementation UIViewController (VBCategory)

+ (instancetype)controllerFromNib {
    return [[[self class] alloc] initWithNibName:NSStringFromClass([self class])
                                          bundle:[NSBundle mainBundle]];
}

@end
