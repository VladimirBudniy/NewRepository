//
//  VBObjCTests.m
//  VBObjCTests
//
//  Created by Vladimir Budniy on 27.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "VBFemale.h"
#import "VBMale.h"
#import "VBAlphabet.h"

@interface VBObjCTests : XCTestCase


@end

@implementation VBObjCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVBEssenceTask2 {
    VBFemale *womentest = [VBFemale object];
    XCTAssert(womentest.retainCount == 1);
    
    VBFemale *woman = [[[VBFemale alloc] initWithName:@"Lena"] autorelease];
    XCTAssert(woman.retainCount == 1);
    
    VBMale *man = [[[VBMale alloc] initWithName:@"Kolya"] autorelease];
    XCTAssert(man.retainCount == 1);
    
    NSArray *array = @[womentest, woman, man];
    XCTAssert(array.count == 3);
    NSLog(@"\n");
    for (id skills in array) {
        [skills performGenderSpecificOperation];
    }
    NSLog(@"\n");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAlphabet {
    NSLog(@"\n");
    NSString *stringHighAlphabet = [NSString highLettersAlphabet];
    XCTAssert(stringHighAlphabet.length == 26);
    NSLog(@" -- String with high alphabet -- %@", stringHighAlphabet);
    
    NSString *stringLowAlphabet = [NSString lowLettersAlphabet];
    XCTAssert(stringLowAlphabet.length == 26);
    NSLog(@" -- String with low alphabet -- %@", stringLowAlphabet);
    
    NSString *stringWithNumbers = [NSString numericAlphabet];
    XCTAssert(stringWithNumbers.length == 10);
    NSLog(@" -- String with numbers -- %@", stringWithNumbers);
    
    NSString *stringFullAlphabet = [NSString alphanumericAlphabet];
    XCTAssert(stringFullAlphabet.length == 62);
    NSLog(@" -- String with high, low and numbers alphabet -- %@", stringFullAlphabet);
    
    NSString *alphabet = [NSString lettersAlphabet];
    XCTAssert(alphabet.length == 52);
    NSLog(@" -- String alphabet -- %@", alphabet);
    NSLog(@"\n");
}



- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
}

@end
