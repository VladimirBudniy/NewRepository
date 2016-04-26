//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

static const CGFloat    kVBDefaultAnimationDuration = 0.5;

@interface VBLabelView ()
@property (nonatomic, assign) NSUInteger squarePosition;

- (CGRect)frameForSquarePosition:(NSUInteger)squarePosition;

- (VBLabelLocation)nextSquarePosition;

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(NSUInteger)squarePosition
                 animated:(BOOL)animated
        completionHandler:(VBLabelHandler)handler;

@end

@implementation VBLabelView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(NSUInteger)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated {
    if (_squarePosition != squarePosition) {
        [self setSquarePosition:squarePosition animated:animated completionHandler:^{
            _squarePosition = squarePosition;
        }];
    }
}

- (void)setSquarePosition:(NSUInteger)squarePosition
                 animated:(BOOL)animated
        completionHandler:(VBLabelHandler)handler
{
    [UIView animateWithDuration:animated ? kVBDefaultAnimationDuration : 0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.label.frame = [self frameForSquarePosition:squarePosition];
                     } completion:^(BOOL finished){
                         if (handler) {
                             handler();
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)moveLabelaAnimated:(BOOL)animatd {
    [self setSquarePosition:[self nextSquarePosition] animated:animatd];
}

#pragma mark -
#pragma mark Private

- (VBLabelLocation)nextSquarePosition {
    switch (self.squarePosition) {
        case kVBLabelUpperLeftLocation:
            return kVBLabelUpperRightLocation;
            
        case kVBLabelUpperRightLocation:
            return kVBLabelLowerRightLocation;
            
        case kVBLabelLowerRightLocation:
            return kVBLabelLowerLeftLocation;
            
        default:
            return kVBLabelUpperLeftLocation;
    }
}

- (CGRect)frameForSquarePosition:(NSUInteger)squarePosition {
    
    CGFloat xPoint = 0;
    CGFloat yPoint = 0;
    
    CGSize upperViewSize = self.upperView.frame.size;
    CGSize labelSize = self.label.frame.size;
    
    CGFloat xPointUpperRight = upperViewSize.width - labelSize.width;
    CGFloat yPointLowerRight = upperViewSize.height - labelSize.height;
    
    switch (squarePosition) {
        case kVBLabelUpperRightLocation:
            xPoint = xPointUpperRight;
            break;
            
        case kVBLabelLowerRightLocation:
            xPoint = xPointUpperRight;
            yPoint = yPointLowerRight;
            break;
            
        case kVBLabelLowerLeftLocation:
            yPoint = yPointLowerRight;
            break;
    }
    
    return CGRectMakeWithSize(xPoint, yPoint, labelSize);
}

@end


