//
//  VBImageView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 26.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageView.h"
#import "VBImageModel.h"

@interface VBImageView ()
@property (nonatomic, strong) UIImageView               *imageView;
@property (nonatomic, strong) UIActivityIndicatorView   *spinner;

- (void)performSpinnerAnimation;
- (void)baseInit;
- (void)load;

@end

@implementation VBImageView

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUrl:(NSString *)url {
    if (_url != url) {
        _url = url;
        
        self.model = [VBImageModel imageModelWithURL:url]; //??????????????????????????????????
        
        self.imageView.image = nil;
        
        VBWeakSelfMacro;
        [_model addHandler:^(UIImage *image){
            VBStrongSelfAndReturnNilMacroWithClass(VBImageView)
            strongSelf.imageView.image = image;
            [strongSelf.spinner stopAnimating];
        } forState:kVBModelLoadedState
                    object:self];
        
        [self load];
    }
}

#pragma mark -
#pragma mark Private

- (void)load {
    [self performSpinnerAnimation];
    [self.model load];
}

- (void)baseInit {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)performSpinnerAnimation {
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.color = [UIColor blackColor];
    
    [spinner startAnimating];
    
    UIImageView *imageView = self.imageView;
    [imageView addSubview:spinner];
    
    spinner.center = imageView.center;
    spinner.hidesWhenStopped = YES;
    self.spinner = spinner;
}

@end

