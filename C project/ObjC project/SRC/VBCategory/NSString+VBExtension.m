//
//  NSString+VBExtension.m
//  C project
//
//  Created by Vladimir Budniy on 25.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSString+VBExtension.h"

static const NSUInteger kVBStringLength      = 5;
static const NSUInteger kVBRandomeCharRange  = 25;
static const NSUInteger kVBFirstCharIndex    = 65;

static NSString * const kVBTestAlphabet = @"ABCabc123";

@implementation NSString (VBExtension)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kVBStringLength) + 1];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    NSString *string = [NSString string];
    for (NSUInteger index = 0; index < length; index++) {
        NSUInteger randomValue = arc4random_uniform(kVBRandomeCharRange) + kVBFirstCharIndex;
        NSString *charString = [NSString stringWithFormat:@"%c", (unichar)randomValue];
        string = [string stringByAppendingString:charString];
    }

    return string;
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    NSUInteger lenght = arc4random_uniform(kVBStringLength) + 1;
    
    return [self randomStringWithLenght:lenght alphabet:kVBTestAlphabet];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)length
                           alphabet:(NSString *)alphabet
{
    NSString *string = [NSString string];
    for (NSUInteger index = 0; index < length; index++) {
        uint32_t alfabetLenght = (uint32_t)[alphabet length] - 1;
        NSUInteger charIndex = arc4random_uniform(alfabetLenght);
        unichar charValue = [alphabet characterAtIndex:charIndex];
        NSString *charString = [NSString stringWithFormat:@"%c", charValue];
        string = [string stringByAppendingString:charString];
    }
    
    return string;
}

@end
