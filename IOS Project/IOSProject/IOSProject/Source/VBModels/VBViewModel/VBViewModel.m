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
static CGFloat    const kVBDefaultDuration   = 1.0;
static CGFloat    const kVBLoadingAlpha      = 0.8;
static CGFloat    const kVBRemovingAlpha     = 0.0;

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
    [self showLoadingViewWithDefaultTextAnimated:NO];
}

- (void)showLoadingViewWithDefaultTextAnimated:(BOOL)animated {
    [self showLoadingViewWithText:kVBDefaultLodingText animated:animated];
}

- (void)showLoadingViewWithText:(NSString *)text {
    [self showLoadingViewWithText:text animated:NO];
}

- (void)showLoadingViewWithText:(NSString *)text animated:(BOOL)animated {
    VBLoadingView *view = self.loadingView;
    if (!view) {
        view = [UINib loadFromNibWithClass:[VBLoadingView class]];
        view.label.text = text;
        self.loadingView = view;
    }
    
    [UIView animateWithDuration:animated ? kVBDefaultDuration : 0
                     animations:^{
                         view.alpha = kVBLoadingAlpha;
                         [self addSubview:view];
                     }];
}

- (void)removeLoadingView {
    [self removeLoadingViewAnimated:NO];
}

- (void)removeLoadingViewAnimated:(BOOL)animated {
    [UIView animateWithDuration:animated ? kVBDefaultDuration : 0
                     animations:^{
                         self.loadingView.alpha = kVBRemovingAlpha;
                     }
                     completion:^(BOOL finished){
//                         [self.loadingView removeFromSuperview];
                     }];
}

@end








