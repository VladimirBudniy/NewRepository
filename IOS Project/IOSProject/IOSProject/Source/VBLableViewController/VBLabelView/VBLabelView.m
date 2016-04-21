//
//  VBLabelView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLabelView.h"

@implementation VBLabelView

#pragma mark -
#pragma mark Public

- (void)changeLabel {
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = @"New test label";
    
}

- (void)moveLabel {
    CGAffineTransform transformDown = CGAffineTransformMakeTranslation(0, 70);
    CGAffineTransform transformSize = CGAffineTransformMakeScale(1.4, 1.5);
    CGAffineTransform transform = CGAffineTransformConcat(transformDown, transformSize);
    
    [UIView animateWithDuration:1
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.label.transform = transform;
                     } completion:^(BOOL finished){
                         self.label.text = @"Animation finished";
                     }];
}

@end


