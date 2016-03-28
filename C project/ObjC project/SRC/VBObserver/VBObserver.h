//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBTestBlock)(void);

@interface VBObserver : NSObject
@property (nonatomic, readonly) NSArray             *observers;
@property (nonatomic, assign)   NSUInteger          state;
@property (nonatomic, retain)   NSMutableDictionary *stateBlock;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)addBlockForState:(VBTestBlock)employeeBlock state:(NSUInteger)state;
- (void)removeBlockForState:(NSUInteger)state;

- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObservers;
- (BOOL)observedObject:(id)object;

@end
