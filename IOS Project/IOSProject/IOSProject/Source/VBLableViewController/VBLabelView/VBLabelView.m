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

- (void)labelLocation:(NSUInteger)location;

@end

@implementation VBLabelView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.squarePosition = kVBLabelUpperLeftLocation;
}

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(NSUInteger)squarePosition {
    if (_squarePosition != squarePosition) {
        _squarePosition = squarePosition;
    }
}

#pragma mark -
#pragma mark Public

- (void)moveLabel {
    sleep(0.3);
    [self labelLocation:self.squarePosition];
}

- (void)animateLabel {
    [UIView animateWithDuration:0.5
                          delay:0.3
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self labelLocation:self.squarePosition];
                     } completion:^(BOOL finished){
                    //self.label.text = @"Ok!";
                     }];
}

#pragma mark -
#pragma mark Private

- (void)labelLocation:(NSUInteger)location {
    switch (location) {
        case kVBLabelUpperLeftLocation:
            self.label.frame = upperRightLocation;
            self.squarePosition = kVBLabelUpperRightLocation;
            break;
            
        case kVBLabelUpperRightLocation:
            self.label.frame = lowerRightLocation;
            self.squarePosition = kVBLabelLowerRightLocation;
            break;
            
        case kVBLabelLowerRightLocation:
            self.label.frame = lowerLeftLocation;
            self.squarePosition = kVBLabelLowerLeftLocation;
            break;
            
        case kVBLabelLowerLeftLocation:
            self.label.frame = upperLeftLocation;
            self.squarePosition = kVBLabelUpperLeftLocation;
            break;
    }
}

@end


