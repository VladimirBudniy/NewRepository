//
//  NSString+VBExtension.h
//  C project
//
//  Created by Vladimir Budniy on 25.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VBExtension)

+ (instancetype)lowLettersAlphabet;
+ (instancetype)highLettersAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)highLowLettersAlphabet;
+ (instancetype)alphanumericAlphabet;

+ (instancetype)lettersAlphabet;

// Methods with alphabet and length with default values:
// - default value for length is 5;
// - default alphabet is lowLettersAlphabet;

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;

+ (instancetype)randomStringWithLenght:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
