//
//  VBModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 23.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

typedef NS_ENUM(NSUInteger, VBModelState) {
    kVBModelDefaultState,
    kVBModelLoadingState,
    kVBModelChangeState,
    kVBModelLoadedState
};

@interface VBModel : VBObserver

- (void)load;

@end
