//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBObserver : NSObject
@property (nonatomic, readonly) NSArray *observers;

- (void)addObserver:(id)object;
- (void)removeObserver:(id)object;
- (void)notifyObserver;

@end
