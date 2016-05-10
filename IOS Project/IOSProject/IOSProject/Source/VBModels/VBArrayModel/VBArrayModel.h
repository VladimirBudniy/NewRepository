//
//  VBArrayModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBArrayModel : NSObject
@property (nonatomic, readonly) NSArray *objects;

+ (instancetype)arrayModelWithObject:(id)object;
+ (instancetype)arrayModelWithArray:(NSArray *)objects;

- (instancetype)initWithObject:(id)object;
- (instancetype)initWithArray:(NSArray *)objects;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeAllObjects;

- (NSUInteger)count;

- (void)moveCellAtIndex:(NSUInteger)atIndex toIndex:(NSUInteger)toIndex ;

@end