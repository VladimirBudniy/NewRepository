//
//  VBEssence.h
//  C project
//
//  Created by Vladimir Budniy on 18.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBEssence : NSObject
@property (nonatomic, readonly) NSString     *name;
@property (nonatomic, readonly) NSArray      *children;
@property (nonatomic, readonly) NSUInteger   age;
@property (nonatomic, readonly) CGFloat      weight;

+ (id)essenceWithName:(NSString *)name
                  age:(NSUInteger)age
               weight:(NSUInteger)weight;

- (instancetype)initWithName:(NSString *)name;

- (void)sayHi;
- (void)addChild:(id)child;
- (void)removeChild:(id)child;
- (void)removeChildren;
- (void)performGenderSpecificOperation;

@end
