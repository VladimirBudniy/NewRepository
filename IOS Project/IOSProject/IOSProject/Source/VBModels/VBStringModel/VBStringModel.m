//
//  VBStringModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringModel.h"

const NSUInteger kVBDefaultArrayCount = 10;

static NSString * const kVBStringModelImage = @"cellImage.png";

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
        self.string = [NSString randomString];
        self.image = [UIImage imageNamed:kVBStringModelImage];
    }
    
    return self;
}

@end

