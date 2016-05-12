//
//  VBObserverObject.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBEmployeeHandler)(id object);

@interface VBObserverObject : NSObject
@property (nonatomic, weak) id                object;
@property (nonatomic, copy) VBEmployeeHandler handler;

+ (VBObserverObject *)objectWithObject:(id)object handler:(VBEmployeeHandler)handler;

- (instancetype)initWithObject:(id)object handler:(VBEmployeeHandler)handler;

@end
