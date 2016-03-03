//
//  VBAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAlphabet.h"
#import "VBRangeAlphabet.h"
#import "VBStringAlphabet.h"
#import "VBArrayAlphabet.h"

@implementation VBAlphabet

@dynamic string;
@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[VBRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithLowercaseLettersRange {
    return [[[VBRangeAlphabet alloc] initWithLowercaseLettersRange] autorelease];
}
+ (instancetype)alphabetWithUppercaseLettersRange {
    return [[[VBRangeAlphabet alloc] initWithUppercaseLettersRange] autorelease];
}
+ (instancetype)alphabetWithNumbers {
    return [[[VBRangeAlphabet alloc] initWithNumericRange] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[VBStringAlphabet alloc] initWithString:string] autorelease];
}

+ (instancetype)alphabetWithArray:(NSArray *)array {
    return [[[VBArrayAlphabet alloc] initWithArray:array] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithRange:(NSRange)range {
    [self autorelease];
    
    return [[VBRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithString:(NSString *)string {
    [self autorelease];
    
    return [[VBStringAlphabet alloc] initWithString:string];
}

- (instancetype)initWithArray:(NSArray *)array {
    [self autorelease];
    
    return [[VBArrayAlphabet alloc] initWithArray:array];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    return nil;
}

- (NSUInteger)count {
    return  0;
}

@end
