//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBObserver : NSObject
@property (nonatomic, readonly) NSArray     *observers;
@property (nonatomic, readonly) NSUInteger  state;


- (instancetype)initWithState:(NSUInteger)state;
- (instancetype)initWithState:(NSUInteger)state money:(NSUInteger)money;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObservers;

- (SEL)selectorForState:(NSUInteger)state;

@end
