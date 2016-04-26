//
//  UIView+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 26.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

CG_INLINE CGRect
CGRectMakeWithSize(CGFloat x, CGFloat y, CGSize size) {
    CGRect rect;
    rect.origin.x = x; rect.origin.y = y;
    rect.size = size;
    return rect;
}

@interface UIView (VBCategory)

@end
