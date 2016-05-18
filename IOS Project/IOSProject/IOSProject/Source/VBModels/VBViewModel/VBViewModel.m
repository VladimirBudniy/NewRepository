//
//  VBViewModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 18.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"
#import "VBLoadingView.h"

@implementation VBViewModel

#pragma mark - 
#pragma mark Public

- (void)showDownloading {
    VBLoadingView *view = [UINib objectFromNibWithClass:[VBLoadingView class]];
    [self addSubview:view];
}

- (void)removeDownloading {
    VBLoadingView *view = [UINib objectFromNibWithClass:[VBLoadingView class]];
    [self willRemoveSubview:view];
}

@end
