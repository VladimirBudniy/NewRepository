//
//  UIView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIView+VBCategory.h"

#define VBCustormSnowWhiteColor [UIColor colorWithRed:255 green:250 blue:250 alpha:1]

static CGFloat  const kVBDefaultCornerRadius        = 15;
static CGFloat  const kVBDefaultBorderWidths        = 1.5;

@implementation UIView (VBCategory)

- (void)changePropertiesOnDefaultsData {
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    [self changeCorners:kVBDefaultCornerRadius];
    [self changeBorderWidth:kVBDefaultBorderWidths];
    [self changeBorderColor:VBCustormSnowWhiteColor];
}

- (void)changeCornerRadius:(CGFloat)cornerRadius
                 borderColor:(UIColor *)color
                 borderWidth:(CGFloat)borderWidth
{
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    [self changeCorners:cornerRadius];
    [self changeBorderWidth:borderWidth];
    [self changeBorderColor:color];
}

- (void)changeCorners:(CGFloat)cornersRadius {
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = cornersRadius;
}

- (void)changeBorderWidth:(CGFloat)borderWidth {
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    layer.borderWidth = borderWidth;
}

- (void)changeBorderColor:(UIColor *)color {
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    layer.borderColor = [color CGColor];
}

- (void)changeBackgraundColor:(UIColor *)color {
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    layer.backgroundColor = [color CGColor];
}



@end
