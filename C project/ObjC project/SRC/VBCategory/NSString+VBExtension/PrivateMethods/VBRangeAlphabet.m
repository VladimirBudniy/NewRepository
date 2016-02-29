//
//  VBRangeAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRangeAlphabet.h"

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

@end
