//
//  NSString+VBExtension.h
//  C project
//
//  Created by Vladimir Budniy on 25.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VBExtension)

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;
+ (instancetype)randomStringWithLenght:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
