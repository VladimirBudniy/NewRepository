//
//  VBAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAlphabet.h"
#import "VBRangeAlphabet.h"

@implementation VBAlphabet

@dynamic string;
@dynamic count;

#pragma mark -
#pragma mark Initializations and Deallocatins

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[VBRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithLowercaseLettersRange {
    return [[[VBRangeAlphabet alloc] initWithLowercaseLettersRange] autorelease];
}
+ (instancetype)alphabetWithUppercaseLettersRange {
    return [[[VBRangeAlphabet alloc] initWithUppercaseLettersRange] autorelease];;
}
+ (instancetype)alphabetWithNumbers {
    return [[[VBRangeAlphabet alloc] initWithNumericRange] autorelease];
}

- (instancetype)initWithRange:(NSRange)range {
    [self autorelease];
    
    return [[VBRangeAlphabet alloc] initWithRange:range];
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
