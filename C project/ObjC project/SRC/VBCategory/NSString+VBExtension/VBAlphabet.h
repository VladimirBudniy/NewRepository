//
//  VBAlphabet.h
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBAlphabet : NSObject
@property (nonatomic, readonly) NSString    *string;
@property (nonatomic, readonly) NSUInteger  count;

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithLowercaseLettersRange;
+ (instancetype)alphabetWithUppercaseLettersRange;
+ (instancetype)alphabetWithNumbers;

- (instancetype)initWithRange:(NSRange)range;

@end
