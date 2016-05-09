//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBStringModel.h"

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBStringModel *)theModel {
    self.cellLabel.text = theModel.string;
    self.cellImage.image = theModel.image;
}

@end
