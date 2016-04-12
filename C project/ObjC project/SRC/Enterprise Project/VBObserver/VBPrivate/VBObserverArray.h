//
//  VBObserverArray.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBObserver.h"

@interface VBObserverArray : NSObject
@property (nonatomic, readonly) NSArray *handlers;

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForObject:(id)object;
- (void)removeHandlerForObject:(id)object;

@end
