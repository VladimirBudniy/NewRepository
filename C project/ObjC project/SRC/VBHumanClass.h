//
//  VBHumanClass.h
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kVBUndefindeGenderType,
    kVBMaleGenderType,
    kVBFemaleGenderType,
} VBObjectGenderType;

@interface VBHuman : NSObject {
    NSUInteger humanAge;
    NSUInteger humanWeight;
    NSString *humanName;
    NSArray  *children;
    VBObjectGenderType genderType;
}

@property (nonatomic, readwrite, assign) NSUInteger         humanAge;
@property (nonatomic, readwrite, assign) NSUInteger         humanWeight;
@property (nonatomic, readwrite, assign) NSString           *humanName;
@property (nonatomic, readwrite, retain) NSArray            *children;
@property (nonatomic, readwrite, assign) VBObjectGenderType genderType;

- (id)initWithName:(NSString *)name;

- (BOOL)ableToBirth:(VBObjectGenderType)genderType;
- (BOOL)ableToFight:(VBObjectGenderType)genderType;
- (void)addChild;
- (void)removeChild;
- (void)removeChildren;

- (void)sayHi;

+ (id)createHumanWithName:(NSString *)name
                      age:(NSUInteger)age
                   weight:(NSUInteger)weight
                   gender:(VBObjectGenderType)gender;

@end
