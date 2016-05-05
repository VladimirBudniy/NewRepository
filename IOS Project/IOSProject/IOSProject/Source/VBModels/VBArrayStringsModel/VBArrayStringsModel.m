//
//  VBArrayStringsModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSString+VBCategory.h"

#import "VBArrayStringsModel.h"
#import "VBAlphabet.h"

const NSUInteger kVBArrayCount = 30;

@interface VBArrayStringsModel ()

- (NSArray *)randomStringsWithCount:(NSUInteger)count;

@end

@implementation VBArrayStringsModel

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithArrayRandomStrings {
    self = [super init];
    if (self) {
        self.arrayStrings = [self randomStringsWithCount:arc4random_uniform(kVBArrayCount) + 1];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Private

- (NSArray *)randomStringsWithCount:(NSUInteger)count {
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < count; index++) {
        NSString *string = [NSString randomString];
        [array addObject:string];
    }
    
    return array;
}

@end
