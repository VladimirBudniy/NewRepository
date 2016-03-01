//
//  NSString+VBExtension.h
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VBExtension)

// Methods with alphabet and length with default values:
// - default value for length is 5;
// - default alphabet is lowLettersAlphabet;

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;
+ (instancetype)randomStringWithLenght:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
