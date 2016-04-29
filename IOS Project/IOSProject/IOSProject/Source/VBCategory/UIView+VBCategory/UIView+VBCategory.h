//
//  UIView+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VBCategory)

- (void)changeCornerRadius:(CGFloat)cornerRadius
               borderColor:(UIColor *)color
               borderWidth:(CGFloat)borderWidth
             masksToBounds:(BOOL)masksToBounds;

@end
