//
//  VBObserverWorkObject.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBObserverArray.h"
#import "VBObserver.h"

@interface VBObserverWorkObject : NSObject
@property (nonatomic, assign) NSUInteger *state;
@property (nonatomic, retain) VBObserverArray *observerArray;

+ (VBObserverWorkObject *)objectWithState:(NSUInteger *)state array:(VBObserverArray *)objectsArray;

- (instancetype)initWithState:(NSUInteger *)state array:(VBObserverArray *)array;

@end
