//
//  VBObserverWorkObject.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBObserverArray.h"

@interface VBObserverWorkObject : NSObject
@property (nonatomic, assign) NSUInteger *state;
@property (nonatomic, retain) VBObserverArray *observerArray;

@end
