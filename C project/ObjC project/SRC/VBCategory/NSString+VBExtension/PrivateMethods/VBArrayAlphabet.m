//
//  VBArrayAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 02.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBArrayAlphabet.h"

@interface VBArrayAlphabet ()
@property (nonatomic, retain) NSMutableArray * array;

@end

@implementation VBArrayAlphabet


#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithArray:(NSMutableArray *)array {
    self = [super init];
    if (self) {
        self.array = array;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = 0; index < self.array.count; index++) {
        for (NSUInteger charIndex = 0; charIndex < [self.array[index] count]; charIndex++) {
            unichar charValue = [self.array[index] characterAtIndex:charIndex];
            [string appendString:[NSString stringWithFormat:@"%c", charValue]];
        }
    }

    return [string copy];
}

- (NSUInteger)count {
    return (self.string.length - 1);
}

@end
