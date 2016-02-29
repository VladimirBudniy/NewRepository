//
//  VBAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAlphabet.h"
#import "VBRangeAlphabet.h"

@implementation VBAlphabet

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[VBRangeAlphabet alloc] initWithRange:range] autorelease];
}

@end
