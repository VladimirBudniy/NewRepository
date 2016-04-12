//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBObserverWorkObject.h"

typedef void (^VBEmployeeHandler)(void);

@interface VBObserver : NSObject
@property (nonatomic, assign)   NSUInteger          state;
@property (nonatomic, retain)   NSMutableDictionary *handlersDictionary;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForObject:(id)object;


@end
