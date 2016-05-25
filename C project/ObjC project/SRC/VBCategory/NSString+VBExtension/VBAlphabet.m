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
    return [[[VBRangeAlphabet alloc] initWithRange:NSMakeRange('a', 'z' - 'a')] autorelease];
}

+ (instancetype)alphabetWithUppercaseLettersRange {
    return [[[VBRangeAlphabet alloc] initWithRange:NSMakeRange('A', 'Z' - 'A')] autorelease];
}

+ (instancetype)alphabetWithNumbers {
    return [[[VBRangeAlphabet alloc] initWithRange:NSMakeRange('0', '9' - '0')] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[VBStringAlphabet alloc] initWithString:string] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)array {
    return [[[VBArrayAlphabet alloc] initWithAlphabets:array] autorelease];
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

- (instancetype)initWithAlphabets:(NSArray *)array {
    [self autorelease];
    
    return [[VBArrayAlphabet alloc] initWithAlphabets:array];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    return nil;
}

- (NSUInteger)count {
    return  0;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    
    if (state->state >= self.count) {
        return  0;
    }
    
    state->mutationsPtr = (unsigned long *)self;
    NSUInteger stateCount = state->state;
    NSUInteger lenght = MIN(len, (self.count) - stateCount);
    
    for (NSUInteger index = 0; index < lenght; index++) {
        NSString *stringSymbol = self[index + stateCount];
        buffer[index] = stringSymbol;
    }
    
    state->state = stateCount + lenght;
    state->itemsPtr = buffer;
    
    return lenght;
}

#pragma mark -
#pragma mark Pablic

- (NSString *)objectAtIndex:(NSUInteger)index {
    return [self objectAtIndexedSubscript:index];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [NSString stringWithFormat:@"%c", [self.string characterAtIndex:index]];
}

@end
