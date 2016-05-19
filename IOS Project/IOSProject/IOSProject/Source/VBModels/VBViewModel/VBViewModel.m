//
//  VBViewModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 18.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"
#import "VBLoadingView.h"

static NSString * const kVBDefaultLodingText = @"... loading ...";

@interface VBViewModel ()
@property (nonatomic, strong) VBLoadingView *loadingView;

@end

@implementation VBViewModel

#pragma mark - 
#pragma mark Public

- (void)showLoadingView {
    [self showLoadingViewWithText:nil];
}

- (void)showLoadingViewWithDefaultText {
    [self showLoadingViewWithText:kVBDefaultLodingText];
}

- (void)showLoadingViewWithText:(NSString *)text {
    VBLoadingView *view = self.loadingView;
    if (!view) {
        view = [UINib loadFromNibWithClass:[VBLoadingView class]];
        view.label.text = text;
        self.loadingView = view;
    }
    
    [self addSubview:view];
}

- (void)removeLoadingView {
    [self.loadingView removeFromSuperview];
}

@end
