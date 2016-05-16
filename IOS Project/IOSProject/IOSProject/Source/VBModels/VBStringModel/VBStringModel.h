//
//  VBStringModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBStringModel : NSObject <NSCoding>
@property (nonatomic, readonly)   NSString *string;
@property (nonatomic, readonly)   UIImage  *image;

+ (instancetype)randomStringModel;
+ (NSArray *)randomStringsModels;

@end
