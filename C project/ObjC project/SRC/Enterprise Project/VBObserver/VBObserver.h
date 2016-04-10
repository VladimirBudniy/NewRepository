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
@property (nonatomic, assign)   NSUInteger          state;
@property (nonatomic, retain)   NSMutableDictionary *handlersDictionary;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addHandlerForState:(VBEmployeeHandler)employeeBlock state:(NSUInteger)state;
- (void)removeHandlerForState:(NSUInteger)state;


@end
