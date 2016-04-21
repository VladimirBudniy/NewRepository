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

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    
//}

- (void)changeLabel {
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = @"New test label";
    
}


@end


