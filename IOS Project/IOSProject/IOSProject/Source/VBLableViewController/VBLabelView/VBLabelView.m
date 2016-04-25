//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

static const CGRect upperLeftLocation  =    { { 20.0f, 40.0f }, { 80.0f, 60.0f } };
static const CGRect upperRightLocation =    { { 220.0f, 40.0f }, { 80.0f, 60.0f } };
static const CGRect lowerRightLocation =    { { 220.0f, 400.0f }, { 80.0f, 60.0f } };
static const CGRect lowerLeftLocation  =    { { 20.0f, 400.0f }, { 80.0f, 60.0f } };

@interface VBLabelView ()
@property (nonatomic, assign) NSUInteger squarePosition;

- (CGRect)labelLocation:(NSUInteger)squarePosition;
- (VBLabelLocation)nextLocation;

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated;

@end

@implementation VBLabelView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(NSUInteger)squarePosition {
    if (_squarePosition != squarePosition) {
        _squarePosition = squarePosition;
        self.label.frame = [self labelLocation:_squarePosition];
    }
}

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated {
    if (animated == YES) {
        [UIView animateWithDuration:0.5
                              delay:0.3
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.squarePosition = [self nextLocation];
                         } completion:^(BOOL finished){
                             
                         }];
    } else {
        self.squarePosition = [self nextLocation];
    }
}

#pragma mark -
#pragma mark Public

- (void)moveLabel {
    self.squarePosition = [self nextLocation];
}

- (void)animateLabel {
    [self setSquarePosition:self.squarePosition animated:YES];
}

#pragma mark -
#pragma mark Private

- (VBLabelLocation)nextLocation {
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

- (CGRect)labelLocation:(NSUInteger)squarePosition {
    switch (squarePosition) {
        case kVBLabelUpperLeftLocation:
            return upperLeftLocation;
            
        case kVBLabelUpperRightLocation:
            return upperRightLocation;
            
        case kVBLabelLowerRightLocation:
           return lowerRightLocation;
            
        default:
           return lowerLeftLocation;
    }
}

@end


