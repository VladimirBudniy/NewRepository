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
@property (nonatomic, assign) NSUInteger state;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addHandler:(VBEmployeeHandler)handler forState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForState:(NSUInteger)state;
- (void)removeHandlerForObject:(id)object;

@end
