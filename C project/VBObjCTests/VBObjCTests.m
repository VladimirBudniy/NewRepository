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
//    VBFemale *womentest = [VBFemale object];
//    XCTAssert(womentest.retainCount == 1);
//    
//    VBFemale *woman = [[[VBFemale alloc] initWithName:@"Lena"] autorelease];
//    XCTAssert(woman.retainCount == 1);
//    
//    VBMale *man = [[[VBMale alloc] initWithName:@"Kolya"] autorelease];
//    XCTAssert(man.retainCount == 1);
//    
//    NSArray *array = @[womentest, woman, man];
//    XCTAssert(array.count == 3);
//    NSLog(@"\n");
//    for (id skills in array) {
//        [skills performGenderSpecificOperation];
//    }
//    
    NSLog(@"\n");
}

- (void)testRandomStringWithAlphabet {
    NSLog(@"\n");
    NSString *randomString = [NSString randomString];
    XCTAssert(randomString.length != 0);
    NSLog(@" -- Random string -- %@", randomString);
    NSLog(@"%lu", randomString.length);
    
    NSString *randomStringWithLength = [NSString randomStringWithLength:5];
    XCTAssert(randomStringWithLength.length == 5);
    NSLog(@" -- Random string with length -- %@", randomStringWithLength);
    NSLog(@"%lu", randomStringWithLength.length);
    
    VBAlphabet *alphabetLowCase = [VBAlphabet alphabetWithLowercaseLettersRange];
    NSString *randomStringWithAlphabet = [NSString randomStringWithAlphabet:alphabetLowCase];
    XCTAssert(randomStringWithAlphabet.length != 0);
    NSLog(@" -- Random string with alphabet -- %@", randomStringWithAlphabet);
    NSLog(@"%lu", randomStringWithAlphabet.length);
    
    VBAlphabet *alphabetUpperCase = [VBAlphabet alphabetWithUppercaseLettersRange];
    NSString *randomStringWithLenghtAlphabet = [NSString randomStringWithLenght:6 alphabet:alphabetUpperCase];
    XCTAssert(randomStringWithLenghtAlphabet.length == 6);
    NSLog(@" -- Random string with length and alphabet -- %@", randomStringWithLenghtAlphabet);
    NSLog(@"%lu", randomStringWithLenghtAlphabet.length);
    NSLog(@"\n");
}

- (void)testAlphabetWithRange {
    NSLog(@"\n");
    VBAlphabet *alphabet = [VBAlphabet alphabetWithRange:NSMakeRange('A', 5)];
    NSLog(@"%@", alphabet.string);
    NSLog(@"%lu", alphabet.count);
    XCTAssert(alphabet.count == 5);
    
    VBAlphabet *uppercaseAlphabet = [VBAlphabet alphabetWithUppercaseLettersRange];
    NSLog(@"%@", uppercaseAlphabet.string);
    NSLog(@"%lu", uppercaseAlphabet.count);
    XCTAssert(uppercaseAlphabet.count == 25);
    
    VBAlphabet *lowercaseAlphabet = [VBAlphabet alphabetWithLowercaseLettersRange];
    NSLog(@"%@", lowercaseAlphabet.string);
    NSLog(@"%lu", lowercaseAlphabet.count);
    XCTAssert(lowercaseAlphabet.count == 25);
    
    VBAlphabet *numericAlphabet = [VBAlphabet alphabetWithNumbers];
    NSLog(@"%@", numericAlphabet.string);
    NSLog(@"%lu", numericAlphabet.count);
    XCTAssert(numericAlphabet.count == 9);
    NSLog(@"\n");
}

- (void)testAlphabetWithString {
    NSLog(@"\n");
    VBAlphabet *alphabetWithString = [VBAlphabet alphabetWithString:@"ABC123abc"];
    NSLog(@"%@", alphabetWithString.string);
    NSLog(@"%lu", alphabetWithString.count);
    XCTAssert(alphabetWithString.string.length == 9);
    NSLog(@"\n");
}

- (void)testAlphabetWithArray {
    NSLog(@"\n");
    VBAlphabet *alphabet = [VBAlphabet alphabetWithRange:NSMakeRange('A', 5)];
    VBAlphabet *alphabetWithString = [VBAlphabet alphabetWithString:@"ABC123abc"];
    VBAlphabet *lowercaseAlphabet = [VBAlphabet alphabetWithLowercaseLettersRange];
    VBAlphabet *numericAlphabet = [VBAlphabet alphabetWithNumbers];
    
    VBAlphabet *arrayAlphabets = [VBAlphabet alphabetWithArray:@[alphabet, alphabetWithString, lowercaseAlphabet, numericAlphabet]];
    NSLog(@"%@", arrayAlphabets.string);
    NSLog(@"%lu", arrayAlphabets.count);
    NSLog(@"\n");
    NSLog(@"%lu", alphabet.count);
    NSLog(@"%lu", alphabetWithString.count);
    NSLog(@"%lu", lowercaseAlphabet.count);
    NSLog(@"%lu", numericAlphabet.count);
}

- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
}

@end
