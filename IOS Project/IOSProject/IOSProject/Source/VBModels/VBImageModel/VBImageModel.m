//
//  VBImageModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageModel.h"

@interface VBImageModel ()
@property (nonatomic, readonly, getter=isCached) BOOL       cached;
@property (nonatomic, strong)                    NSString   *path;

- (void)removeIfNeeded;

@end

@implementation VBImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)URL {
    return [[self alloc] initWithURL:URL];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithURL:(NSURL *)URL {
    self = [super init];
    if (self) {
        self.URL = URL;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setURL:(NSURL *)URL {
    if (![_URL isEqual:URL]) {
        _URL = URL;
        
        [self dump];
    }
    
    [self load];
}

- (NSString *)path {
    return [self.URL absoluteString];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)prepareToLoad {
    if (self.isCached) {
        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        
        if (!image) {
            [self removeIfNeeded];
        } else {
            self.image = image;
        }
    }
}

- (void)dump {
    self.state = kVBModelUndefinedState;
}

- (void)finishLoad {
    NSUInteger state = self.image ? kVBModelLoadedState : kVBModelFailedState;
    [self setState:state withObject:self.image];
}

#pragma mark -
#pragma mark Private

- (void)removeIfNeeded {
    if (self.isCached) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:&error];
    }
}

@end
