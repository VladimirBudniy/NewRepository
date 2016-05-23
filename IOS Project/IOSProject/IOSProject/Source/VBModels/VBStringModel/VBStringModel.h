//
//  VBStringModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

typedef NS_ENUM(NSUInteger, VBStringModelState) {
    kVBStringModelDefaultState,
    kVBStringModelLoadingState,
    kVBStringModelChangeState,
    kVBStringModelLoadedState
};

@interface VBStringModel : VBObserver <NSCoding>
@property (nonatomic, readonly)   NSString *string;
@property (nonatomic, readonly)   UIImage  *image;

+ (instancetype)randomStringModel;
+ (NSArray *)randomStringsModels;

- (void)load;

@end
