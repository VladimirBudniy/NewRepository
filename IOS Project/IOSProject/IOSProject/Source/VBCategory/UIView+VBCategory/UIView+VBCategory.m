//
//  UIView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 26.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIView+VBCategory.h"

@implementation UIView (VBCategory)

- (void)CGRectMakeWithSize:(CGSize)size pointX:(CGFloat)x pointY:(CGFloat)y {
    CGRectMake(x, y, size.width, size.height);
}



@end
