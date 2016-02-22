//
//  VBEssence.h
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBEssence : NSObject
@property (nonatomic, readonly) NSString     *essenceName;
@property (nonatomic, readonly) NSArray      *children;
@property (nonatomic, readonly) NSUInteger   essenceAge;
@property (nonatomic, readonly) CGFloat      essenceWeight;

+ (id)essenceWithName:(NSString *)name
                      age:(NSUInteger)age
               weight:(NSUInteger)weight;

- (instancetype)init;

- (instancetype)initWithName:(NSString *)name;

- (void)sayHi;
- (void)addChild:(id)child;
- (void)removeChild:(id)child;
- (void)removeChildren;
- (void)performGenderSpecificOperation;
- (VBEssence *)canBirthChild;
- (void)canGoToWar;

@end
