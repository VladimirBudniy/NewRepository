//
//  UIView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIView+VBCategory.h"

@implementation UILabel (VBCategory)

- (void)changeFormatForfView:(UIView *)view
               cornerRadius:(CGFloat)cornerRadius
                borderColor:(UIColor *)color
                borderWidth:(CGFloat)borderWidth
              masksToBounds:(BOOL)masksToBounds
{
    UIView *changeableView = view;
    CALayer *layer = changeableView.layer;
    layer.masksToBounds = masksToBounds;
    layer.cornerRadius = cornerRadius;
    layer.borderColor = [color CGColor];
    layer.borderWidth = borderWidth;
}

- (void)changeFormatForLabel:(UILabel *)label
               cornerRadius:(CGFloat)cornerRadius
                borderColor:(UIColor *)color
                borderWidth:(CGFloat)borderWidth
              masksToBounds:(BOOL)masksToBounds
{
    UILabel *changeableLabel = label;
    CALayer *layer = changeableLabel.layer;
    layer.masksToBounds = masksToBounds;
    layer.cornerRadius = cornerRadius;
    layer.borderColor = [color CGColor];
    layer.borderWidth = borderWidth;
}

- (void)changeFormatForButton:(UIButton *)button
              cornerRadius:(CGFloat)cornerRadius
               borderColor:(UIColor *)color
               borderWidth:(CGFloat)borderWidth
             masksToBounds:(BOOL)masksToBounds
{
    UIButton *changeableButton = button;
    CALayer *layer = changeableButton.layer;
    layer.masksToBounds = masksToBounds;
    layer.cornerRadius = cornerRadius;
    layer.borderColor = [color CGColor];
    layer.borderWidth = borderWidth;
}


@end
