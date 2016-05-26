//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBStringModel.h"

@interface VBTableViewCell ()
@property (nonatomic, strong) VBStringModel *model;

- (void)load;

@end

@implementation VBTableViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(VBStringModel *)model {
    if (_model != model) {
        _model = model;
        
        if (model.state != kVBModelLoadedState) {
            self.cellLabel.text = model.string;
            self.cellImage.image = nil;
            
            VBWeakSelfMacro;
            [_model addHandler:^(UIImage *image){
                VBStrongSelfAndReturnNilMacroWithClass(VBTableViewCell)
                strongSelf.cellImage.image = image;
                [strongSelf.spinner stopAnimating];
            } forState:kVBModelLoadedState
                        object:self];
            
            [self load];
            
        } else {
            self.cellLabel.text = model.string;
            self.cellImage.image = model.image;
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    [self.spinner startAnimating];
    [self.model load];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBStringModel *)theModel {
    self.model = theModel;
}

@end
