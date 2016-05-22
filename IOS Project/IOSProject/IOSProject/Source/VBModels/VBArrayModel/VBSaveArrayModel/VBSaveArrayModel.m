//
//  VBSaveArrayModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 22.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBSaveArrayModel.h"
#import "VBArrayModel.h"
#import "VBStringModel.h"

static NSString * const kVBFileAdress       = @"tmp.plist";

@interface VBSaveArrayModel ()
@property (nonatomic, copy)                      NSString       *path;
@property (nonatomic, readonly, getter=isCached) BOOL            cached;

@end

@implementation VBSaveArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    VBSaveArrayModel *model = [VBSaveArrayModel new];
    if (model.isCached) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:model.path];
    } else {
        return [VBSaveArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
    }
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    NSString *path = [NSFileManager pathFileWithName:kVBFileAdress];
    self.path = path;
    return path;
}


- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

- (void)load {
    if (self.state == kVBArrayModelLoadingState) {
        return;
    } else {
        self.state = kVBArrayModelLoadingState;
    }
    
    VBWeakSelfMacro;
    VBDispatchAsyncInBackground(^{
        sleep(3);
        VBStrongSelfAndReturnNilMacroWithClass(VBArrayModel)
        
        VBSaveArrayModel *model = [VBSaveArrayModel model];
        [strongSelf addObjectsFromArray:model.objects];
        
        VBDispatchAsyncOnMainThread(^{
            strongSelf.state = kVBArrayModelLoadedState;
            
        });
    });
}

@end
