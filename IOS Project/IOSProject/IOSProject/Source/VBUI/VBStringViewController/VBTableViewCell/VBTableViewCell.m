//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBStringModel.h"
#import "VBImageView.h"
#import "VBImageModel.h"

@interface VBTableViewCell ()
@property (nonatomic, strong) VBStringModel *model;

@end

@implementation VBTableViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(VBStringModel *)model {
    if (_model != model) {
        _model = model;
        
        self.cellLabel.text = model.string;
        self.cellImage.url = model.url;
        
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBStringModel *)theModel {
    self.model = theModel;
}

@end
