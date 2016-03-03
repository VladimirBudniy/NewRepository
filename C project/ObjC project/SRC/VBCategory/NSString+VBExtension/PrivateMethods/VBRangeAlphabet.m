//
//  VBRangeAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRangeAlphabet.h"

@interface VBRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@interface VBRangeAlphabet (VBPrivate)

- (void)lowercaseLettersRange;
- (void)uppercaseLettersRange;
- (void)numericLettersRange;

@end

@implementation VBRangeAlphabet

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

- (instancetype)initWithLowercaseLettersRange {
    self = [super init];
    if (self) {
        [self lowercaseLettersRange];
    }
    
    return self;
}

- (instancetype)initWithUppercaseLettersRange {
    self = [super init];
    if (self) {
        [self uppercaseLettersRange];
    }
    
    return self;
}

- (instancetype)initWithNumericRange {
    self = [super init];
    if (self) {
        [self numericAlphabet];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (void)lowercaseLettersRange {
    NSRange range = NSMakeRange('a', 'z' - 'a');
    self.range = range;
}

- (void)uppercaseLettersRange {
    NSRange range = NSMakeRange('A', 'Z' - 'A');
    self.range = range;
}

- (void)numericAlphabet {
    NSRange range = NSMakeRange('0', '9' - '0');
    self.range = range;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    NSRange range = self.range;
    NSUInteger location = range.location;
    
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = location; index <= location + range.length; index++) {
        [string appendString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    return [[string copy] autorelease];
}

- (NSUInteger)count {
    return self.range.length;
}

@end
