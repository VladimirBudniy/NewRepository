//
//  UIView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIView+VBCategory.h"

@implementation UIView (VBCategory)

- (void)changeCornerRadius:(CGFloat)cornerRadius
                 borderColor:(UIColor *)color
                 borderWidth:(CGFloat)borderWidth
               masksToBounds:(BOOL)masksToBounds
{
    CALayer *layer = self.layer;
    layer.masksToBounds = masksToBounds;
    layer.cornerRadius = cornerRadius;
    layer.borderColor = [color CGColor];
    layer.borderWidth = borderWidth;
}


@end
