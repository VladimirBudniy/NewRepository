//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBStringModel.h"

static NSString * const kVBStringModelImage = @"folder.png";

static CGFloat    const kVBDefaultDuration   = 2.0;
static CGFloat    const kVBRemovingAlpha     = 0.1;

@interface VBTableViewCell ()

- (void)loadImage;
- (void)loadImageAnimated:(BOOL)animated;

@end

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBStringModel *)theModel {
    [self fillWithModel:theModel animated:NO];
}

- (void)fillWithModel:(VBStringModel *)theModel animated:(BOOL)animated {
    self.cellLabel.text = theModel.string;
    [self loadImageAnimated:animated];
}

- (void)loadImage {
    [self loadImageAnimated:NO];
}

- (void)loadImageAnimated:(BOOL)animated {
    VBWeakSelfMacro;
    VBDispatchAsyncInBackground(^{
        sleep(5);
        VBStrongSelfAndReturnNilMacroWithClass(VBTableViewCell)
        
        UIImage *image = [UIImage imageWithContentsOfFile:[NSBundle pathForFileWithName:kVBStringModelImage]];
        
        VBDispatchAsyncOnMainThread(^{
            strongSelf.cellImage.image = image;
            [UIView animateWithDuration:animated ? kVBDefaultDuration : 0
                             animations:^{
                                 strongSelf.spinner.alpha = kVBRemovingAlpha;
                             }
                             completion:^(BOOL finished) {
                                 [strongSelf.spinner stopAnimating];
                                 strongSelf.spinner.hidesWhenStopped = YES;
                                 self.spinner = nil;
                             }];
        });
    });
}

@end
