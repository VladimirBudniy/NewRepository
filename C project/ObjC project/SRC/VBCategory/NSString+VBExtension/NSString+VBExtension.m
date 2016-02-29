//
//  NSString+VBExtension.m
//  C project
//
//  Created by Vladimir Budniy on 25.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSString+VBExtension.h"

static const NSUInteger kVBStringLength = 5;

@interface NSString (VBPrivateExtension)

+ (NSString *)stringWithRange:(NSRange)range;
+ (NSString *)stringWithSymbolsFromRange:(unichar)firstChar lastChar:(unichar)lastChar;

@end

@implementation NSString (VBExtension)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)lowLettersAlphabet {
    return [self stringWithSymbolsFromRange:'a' lastChar:'z'];
}

+ (instancetype)highLettersAlphabet {
   return [self stringWithSymbolsFromRange:'A' lastChar:'Z'];
}

+ (instancetype)numericAlphabet {
    return [self stringWithSymbolsFromRange:'0' lastChar:'9'];
}

+ (instancetype)highLowLettersAlphabet {
    NSString *string = [NSString highLettersAlphabet];
    
    return [string stringByAppendingString:[NSString lowLettersAlphabet]];
}

+ (instancetype)alphanumericAlphabet {
    NSString *string = [NSString highLowLettersAlphabet];
    
    return [string stringByAppendingString:[NSString numericAlphabet]];
}

+ (instancetype)lettersAlphabet {
    NSString *string = [NSString string];
    NSString *highAphabet = [NSString highLettersAlphabet];
    NSString *lowAphabet = [NSString lowLettersAlphabet];
    
    for (NSUInteger index = 0; index < highAphabet.length; index++) {
        
        unichar charIndex = [highAphabet characterAtIndex:index];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", charIndex]];
        
        unichar charValue = [lowAphabet characterAtIndex:index];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", charValue]];
    }

    return string;
}

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kVBStringLength) + 1];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLenght:length alphabet:[self lowLettersAlphabet]];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    NSUInteger lenght = arc4random_uniform(kVBStringLength) + 1;
    
    return [self randomStringWithLenght:lenght alphabet:alphabet];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)length
                              alphabet:(NSString *)alphabet
{
//    NSString *string = [NSString string];
    NSMutableString *string = [NSMutableString mutableCopy];
    for (NSUInteger index = 0; index < length; index++) {
        NSUInteger charIndex = arc4random_uniform((uint32_t)alphabet.length - 1);
        unichar charValue = [alphabet characterAtIndex:charIndex];
//        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", charValue]];
        [string appendString:[NSString stringWithFormat:@"%c", charValue]];
    }
    
    return [string copy];
//    return string;
}

#pragma mark -
#pragma mark Private Methods

+ (NSString *)stringWithSymbolsFromRange:(unichar)firstChar lastChar:(unichar)lastChar {
    NSRange range = NSMakeRange(firstChar, lastChar - firstChar);
    
    return [NSString stringWithRange:range];
}

+ (NSString *)stringWithRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = range.location; index <= range.location + range.length; index++) {
        [string appendString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
//    NSString *string = [NSString string];
//    for (NSUInteger index = range.location; index <= range.location + range.length; index++) {
//        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", (unichar)index]];
//    }
    
    return [string copy];
//    return string;
}

@end
