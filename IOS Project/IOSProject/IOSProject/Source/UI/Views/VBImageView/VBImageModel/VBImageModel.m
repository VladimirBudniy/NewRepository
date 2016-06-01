//
//  VBImageModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageModel.h"
#import "VBObjectCache.h"

@interface VBImageModel ()
@property (nonatomic, readonly, getter=isCached) BOOL       cached;
@property (nonatomic, readonly)                  NSString   *path;
@property (nonatomic, readonly)                  NSString   *fileName;

@property (nonatomic, strong) NSURLSession              *session;
@property (nonatomic, strong) NSURLSessionDownloadTask  *task;

@property (nonatomic, readonly) VBObjectCache *cache;

- (void)removeIfNeeded;
- (void)loadFromFile;
- (void)download;

@end

@implementation VBImageModel

@dynamic cached;
@dynamic path;
@dynamic fileName;
@dynamic cache;

#pragma mark -
#pragma mark Class Methods

+ (VBObjectCache *)objectCache {
    static id cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [VBObjectCache new];
    });
    
    return cache;
}

+ (instancetype)imageModelWithURL:(NSURL *)URL {
    return [[self alloc] initWithURL:URL];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.task = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config];
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

- (VBObjectCache *)cache {
    return [VBImageModel objectCache];
}

- (void)setURL:(NSURL *)URL {
    if (![_URL isEqual:URL]) {
        _URL = URL;
        
        [self dump];
    }
    
    [self load];
}

- (NSString *)fileName {
    VBObjectCache *cache = self.cache;
    NSURL *URL = self.URL;
    NSString *name = nil;
    if (cache) {
        name = [cache objectForKey:URL];
    }
    
    if (!name){
        name = [URL lastPathComponent];
    }
    
    return name;
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
        [_task resume];
    }
}

#pragma mark -
#pragma mark Public

- (void)prepareToLoad {
    if (self.URL.isFileURL || self.isCached) {
        [self loadFromFile];
    } else {
        [self download];
    }
}

- (void)dump {
    self.state = kVBModelUndefinedState;
}

#pragma mark -
#pragma mark Private

- (void)download {
    NSString *fileName = [self.cache objectForKey:self.URL];
    if (!fileName) {
        self.task = [self.session downloadTaskWithURL:self.URL
                                    completionHandler:^(NSURL *location, NSURLResponse *response,
                                                        NSError *error)
                     {
                         NSFileManager *manager = [NSFileManager defaultManager];
                         NSError *saveError = nil;
                         [manager copyItemAtURL:location toURL:[NSURL fileURLWithPath:self.path] error:&saveError];
                         [self.cache setObject:self.fileName forKey:self.URL];
                         [self loadFromFile];
                     }];
    } else {
        self.image = [UIImage imageWithContentsOfFile:[NSFileManager pathFileWithName:fileName]];
    }
}

- (void)loadFromFile {
    UIImage *image = [UIImage imageWithContentsOfFile:self.path];
    if (!image) {
        [self removeIfNeeded];
    } else {
        self.image = image;
    }
    
    [self completionLoad];
}

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
