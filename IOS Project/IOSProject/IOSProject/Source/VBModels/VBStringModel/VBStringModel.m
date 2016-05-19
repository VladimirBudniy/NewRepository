//
//  VBStringModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringModel.h"

const NSUInteger kVBDefaultArrayCount = 5;

static NSString * const kVBStringModelImage = @"folder.png";
static NSString * const kVBSringCoderKey    = @"string";

@interface VBStringModel ()
@property (nonatomic, copy)     NSString *string;
@property (nonatomic, strong)   UIImage  *image;

@end

@implementation VBStringModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomStringModel {
    return [[self class] new];
}

+ (NSArray *)randomStringsModels {
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = arc4random_uniform(kVBDefaultArrayCount) + kVBDefaultArrayCount;
    
    for (NSUInteger index = 0; index < count; index++) {
        [array addObject:[self randomStringModel]];
    }
    
    return array;
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.image = [UIImage imageWithContentsOfFile:[NSBundle pathForFileWithName:kVBStringModelImage]];
        self.string = [NSString randomString];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCoding Protocol


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.string = [aDecoder decodeObjectForKey:kVBSringCoderKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:kVBSringCoderKey];
}

@end

