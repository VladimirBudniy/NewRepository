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
@property (nonatomic, readonly)                  NSString        *path;
@property (nonatomic, readonly, getter=isCached) BOOL            cached;

+ (instancetype)model;

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
#pragma mark Accessors

- (NSString *)path {
    return [NSFileManager pathFileWithName:kVBFileAdress];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Private

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

- (void)prepareToLoad {
    VBSaveArrayModel *model = [VBSaveArrayModel model];
    [self addObjects:model.objects];
}

@end
