//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

static CGFloat    const kVBDefaultAnimationDuration        = 0.5;

static CGFloat    const kVBCornerRadius        = 15;
static CGFloat    const kVBBorderWidths        = 1.5;
static BOOL       const kVBMasksToBounds       = YES;

static NSString * const kVBIndicatorInfiniteAnimationOn    = @"  Infinite animation is on";
static NSString * const kVBIndicatorInfiniteAnimationOff   = @"  Infinite animation is off";

static NSString * const kVBIndicatorStepAnimationOn        = @"  Stepping animation is on";
static NSString * const kVBIndicatorStepAnimationOff       = @"  Stepping animation is off";

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
#pragma mark Initializations and Deallocatins

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.upperView changeCornerRadius:kVBCornerRadius
                           borderColor:[UIColor whiteColor]
                           borderWidth:kVBBorderWidths
                         masksToBounds:kVBMasksToBounds];
    
    [self.moveLabelButon changeCornerRadius:kVBCornerRadius
                                borderColor:[UIColor whiteColor]
                                borderWidth:kVBBorderWidths
                              masksToBounds:kVBMasksToBounds];
    
    [self.label changeCornerRadius:kVBCornerRadius
                       borderColor:[UIColor whiteColor]
                       borderWidth:kVBBorderWidths
                     masksToBounds:kVBMasksToBounds];
    
    
    [self.animationLabel changeCornerRadius:kVBCornerRadius
                                borderColor:[UIColor whiteColor]
                                borderWidth:kVBBorderWidths
                              masksToBounds:kVBMasksToBounds];
    
    [self.stepLabel changeCornerRadius:kVBCornerRadius
                           borderColor:[UIColor whiteColor]
                           borderWidth:kVBBorderWidths
                         masksToBounds:kVBMasksToBounds];
    
}


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
                     } completion:^(BOOL finished) {
                         if (handler) {
                             handler();
                         }
                         
                         if (self.stepSwitch.on || self.animationSwitch.on) {
                             [self setSquarePosition:[self nextSquarePosition] animated:self.animationSwitch.on];
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)changeSwitchStatusName {
    self.animationLabel.text = self.animationSwitch.on ? kVBIndicatorInfiniteAnimationOn
    : kVBIndicatorInfiniteAnimationOff;
    
    self.stepLabel.text = self.stepSwitch.on ? kVBIndicatorStepAnimationOn
    : kVBIndicatorStepAnimationOff;
}

- (void)moveLabel {
    [self setSquarePosition:[self nextSquarePosition] animated:self.animationSwitch.on];
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


