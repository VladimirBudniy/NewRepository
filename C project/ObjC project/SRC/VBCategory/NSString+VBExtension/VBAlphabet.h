//
//  VBAlphabet.h
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBAlphabet : NSObject <NSFastEnumeration>

@property (nonatomic, readonly) NSString    *string;
@property (nonatomic, readonly) NSUInteger  count;

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithLowercaseLettersRange;
+ (instancetype)alphabetWithUppercaseLettersRange;
+ (instancetype)alphabetWithNumbers;

+ (instancetype)alphabetWithString:(NSString *)string;

+ (instancetype)alphabetWithArray:(NSArray *)array;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithAlphabets:(NSArray *)array;


- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len;

@end
