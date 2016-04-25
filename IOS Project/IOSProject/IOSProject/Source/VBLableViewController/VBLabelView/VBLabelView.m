//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

static const CGFloat    kVBDefaultAnimationDuration = 0.5;
static const NSUInteger kVBFrameDepth               = 6;

@interface VBLabelView ()
@property (nonatomic, assign) NSUInteger squarePosition;

- (CGRect)frameForSquarePosition:(NSUInteger)squarePosition;
- (VBLabelLocation)nextSquarePosition;

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(NSUInteger)squarePosition
                 animated:(BOOL)animated
        completionHandler:(VBLabelHandler)handler;

- (void)moveLabelWithDuration:(CGFloat)duration completionHandler:(VBLabelHandler)handler;

@end

@implementation VBLabelView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
    
//        [self setSquarePosition:squarePosition animated:animated completionHandler:^{
//            _squarePosition = [self nextSquarePosition];
//        }];
}

- (void)setSquarePosition:(NSUInteger)squarePosition
                 animated:(BOOL)animated
        completionHandler:(VBLabelHandler)handler
{
    CGFloat duration = animated ? kVBDefaultAnimationDuration : 0;
    [self moveLabelWithDuration:duration completionHandler:handler];
}

#pragma mark -
#pragma mark Public

- (void)moveLabel {
    [self setSquarePosition:self.squarePosition animated:NO];
}

- (void)animateLabel {
    [self setSquarePosition:self.squarePosition animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)moveLabelWithDuration:(CGFloat)duration completionHandler:(VBLabelHandler)handler {
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _squarePosition = [self nextSquarePosition];
                         self.label.frame = [self frameForSquarePosition:_squarePosition];
//                         self.label.frame = [self frameForSquarePosition:[self nextSquarePosition]];
                     } completion:^(BOOL finished){
                         if (handler) {
                             handler();
                         }
                     }];
}

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
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    CGFloat labelWidth = self.label.frame.size.width;
    CGFloat labelHeight = self.label.frame.size.height;
    
    switch (squarePosition) {
        case kVBLabelUpperLeftLocation:
            return CGRectMake(kVBFrameDepth, kVBFrameDepth, labelWidth, labelHeight);
            
        case kVBLabelUpperRightLocation:
            return CGRectMake(viewWidth - (kVBFrameDepth + labelWidth), kVBFrameDepth,
                              labelWidth, labelHeight);
            
        case kVBLabelLowerRightLocation:
            return CGRectMake(viewWidth - (kVBFrameDepth + labelWidth),
                              viewHeight - (kVBFrameDepth + labelHeight), labelWidth, labelHeight);
            
        default:
            return CGRectMake(kVBFrameDepth , viewHeight - (kVBFrameDepth + labelHeight),
                              labelWidth, labelHeight);
    }
}

@end


