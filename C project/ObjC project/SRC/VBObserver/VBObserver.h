//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBEmployeeHandler)(void);

@interface VBObserver : NSObject
@property (nonatomic, readonly) NSArray             *observers;
@property (nonatomic, assign)   NSUInteger          state;
@property (nonatomic, retain)   NSMutableDictionary *handlersDictionary;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)addBlockForState:(VBEmployeeHandler)employeeBlock state:(NSUInteger)state;
- (void)removeBlockForState:(NSUInteger)state;

- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObservers;
- (BOOL)observedByObject:(id)object;

@end
