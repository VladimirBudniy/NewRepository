//
//  VBStringModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@interface VBStringModel : NSObject <NSCoding>
@property (nonatomic, readonly)   NSString  *string;
@property (nonatomic, readonly)   NSString  *urlString;

+ (instancetype)randomStringModel;
+ (NSArray *)randomStringsModels;

@end
