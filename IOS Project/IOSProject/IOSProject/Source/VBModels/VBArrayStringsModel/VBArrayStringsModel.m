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

const NSUInteger kVBDefaultArrayCount = 10;


@interface VBArrayStringsModel ()
@property (nonatomic, strong) NSArray *strings;

- (NSArray *)radnomStrings;

@end

@implementation VBArrayStringsModel

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strings = [self radnomStrings];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)arrayStrings {
    return [self.strings copy];
}

#pragma mark -
#pragma mark Pablic

- (NSString *)objectAtIndex:(NSUInteger)index {
    return [self.strings objectAtIndexedSubscript:index];
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.strings objectAtIndex:index];
}

#pragma mark -
#pragma mark Private

- (NSArray *)radnomStrings {
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = arc4random_uniform(kVBDefaultArrayCount) + kVBDefaultArrayCount;

    for (NSUInteger index = 0; index < count; index++) {
        NSString *string = [NSString randomString];
        [array addObject:string];
    }
    
    return [array mutableCopy];
}

@end
