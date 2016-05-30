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
@property (nonatomic, readonly)                  NSString   *path;
@property (nonatomic, readonly)                  NSString   *fileName;

@property (nonatomic, strong) NSURLSession              *session;
@property (nonatomic, strong) NSURLSessionDownloadTask  *task;

- (void)removeIfNeeded;
- (void)completionLoad;

@end

@implementation VBImageModel

@dynamic cached;
@dynamic path;
@dynamic fileName;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)URL {
    return [[self alloc] initWithURL:URL];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    }
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)URL {
    self = [self init];
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

- (NSString *)fileName {
    return [self.URL lastPathComponent];
}

- (NSString *)path {
    return [NSFileManager pathFileWithName:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

-(void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        _task = task;
        [task resume];
    }
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
        
        [self completionLoad];
    } else {
        self.task = [self.session downloadTaskWithURL:self.URL
                                    completionHandler:^(NSURL *location, NSURLResponse *response,
                                                        NSError *error)
                     {
                         NSFileManager *manager = [NSFileManager defaultManager];
                         NSError *saveError = nil;
                         [manager copyItemAtURL:location toURL:[NSURL fileURLWithPath:self.path] error:&saveError];
                         self.image = [UIImage imageWithContentsOfFile:self.path];
                         
                         [self completionLoad];
                     }];
    }
}

- (void)dump {
    self.state = kVBModelUndefinedState;
}

#pragma mark -
#pragma mark Private

- (void)completionLoad; {
    VBWeakSelfMacro;
    VBDispatchAsyncOnMainThread(^{
        VBStrongSelfAndReturnNilMacroWithClass(VBImageModel);
        NSUInteger state = strongSelf.image ? kVBModelLoadedState : kVBModelFailedState;
        [strongSelf setState:state withObject:strongSelf.image];
    });
}

- (void)removeIfNeeded {
    if (self.isCached) {
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
    }
}

@end
