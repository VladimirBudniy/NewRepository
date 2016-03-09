//
//  main.m
//  ObjC project
//
//  Created by Vladimir Budniy on 17.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBEssence.h"
#import "VBEssenceTest.h"
#import "VBAlphabet.h"
#import "VBDelegateTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        VBDelegateTest *delegateTest = [[VBDelegateTest new] autorelease];
        
        VBDelegatingObject *delegatingObject = [[VBDelegatingObject new] autorelease];
        delegatingObject.name = @"Vasya";
        delegatingObject.delegate = delegateTest;
        
        [delegateTest sayMama:delegatingObject];
        
        if ([delegateTest respondsToSelector:@selector(sayPapa:)]) {
            [delegateTest sayPapa:delegatingObject];
        }
    }
    
    return 0;
}
