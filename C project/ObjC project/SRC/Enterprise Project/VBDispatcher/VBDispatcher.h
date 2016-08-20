//
//  VBDispatcher.h
//  C project
//
//  Created by Vladimir Budniy on 07.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBEmployee.h"

@interface VBDispatcher : NSObject

- (instancetype)initWithStaff:(NSArray *)staff;

- (void)addObject:(id)object;
- (BOOL)containsEmployee:(VBEmployee *)employee;

@end
