//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

static CGFloat    const kVBDefaultAnimationDuration        = 0.5;

static NSString * const kVBIndicatorInfiniteAnimationOn    = @"  Animating infinite motion is on";
static NSString * const kVBIndicatorInfiniteAnimationOff   = @"  Animating infinite motion is off";

static NSString * const kVBIndicatorStepAnimationOn        = @"  Stepping infinite motion is on";
static NSString * const kVBIndicatorStepAnimationOff       = @"  Stepping infinite motion is off";

@interface VBLabelView ()
@property (nonatomic, assign) VBLabelLocation squarePosition;

- (CGRect)frameForSquarePosition:(VBLabelLocation)squarePosition;

- (VBLabelLocation)nextSquarePosition;

- (void)setSquarePosition:(VBLabelLocation)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(VBLabelLocation)squarePosition
                 animated:(BOOL)animated
        completionHandler:(VBLabelHandler)handler;

@end

@implementation VBLabelView

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.upperView changePropertiesOnDefaultsData];
    [self.moveLabelButon changePropertiesOnDefaultsData];
    [self.label changePropertiesOnDefaultsData];
    [self.animationLabel changePropertiesOnDefaultsData];
    [self.stepLabel changePropertiesOnDefaultsData];
    
}

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(VBLabelLocation)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(VBLabelLocation)squarePosition animated:(BOOL)animated {
    if (_squarePosition != squarePosition) {
        [self setSquarePosition:squarePosition animated:animated completionHandler:^{
            _squarePosition = squarePosition;
        }];
    }
}

- (void)setSquarePosition:(VBLabelLocation)squarePosition
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
                         
                         if (self.stepSwitch.on) {
                             [self setSquarePosition:[self nextSquarePosition]
                                            animated:self.animationSwitch.on];
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

- (CGRect)frameForSquarePosition:(VBLabelLocation)squarePosition {
    
    CGFloat xPoint = 0;
    CGFloat yPoint = 0;
    
    CGSize upperViewSize = self.upperView.frame.size;
    CGSize labelSize = self.label.frame.size;
    
    CGFloat xPointUpperRight = upperViewSize.width - labelSize.width;
    CGFloat yPointLowerRight = upperViewSize.height - labelSize.height;
    
    switch (squarePosition) {
        case kVBLabelUpperLeftLocation:
            break;
            
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


