//
//  NSString+VBExtension.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSString+VBExtension.h"

static const NSUInteger kVBStringLength = 5;
static NSString * const kVBTestAlphabet = @"ABCabc123";

@implementation NSString (VBExtension)

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kVBStringLength) + 1];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLenght:length alphabet:kVBTestAlphabet];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    NSUInteger lenght = arc4random_uniform(kVBStringLength) + 1;
    
    return [self randomStringWithLenght:lenght alphabet:alphabet];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)length
                              alphabet:(NSString *)alphabet
{
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = 0; index < length; index++) {
        NSUInteger charIndex = arc4random_uniform((uint32_t)alphabet.length - 1);
        unichar charValue = [alphabet characterAtIndex:charIndex];
        [string appendString:[NSString stringWithFormat:@"%c", charValue]];
    }
    
    return [string copy];
}


@end
