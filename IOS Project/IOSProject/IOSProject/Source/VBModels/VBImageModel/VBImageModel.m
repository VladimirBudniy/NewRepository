//
//  VBImageModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageModel.h"

@interface VBImageModel ()
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL    *url;

- (NSString *)imagePath;

@end

@implementation VBImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (NSString *)imagePath {
    NSString *path = [self.url absoluteString];
    return path;
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    self.image = [UIImage imageWithContentsOfFile:[self imagePath]];
}

- (void)finishLoad {
    self.state = kVBModelLoadedState;
}

@end
