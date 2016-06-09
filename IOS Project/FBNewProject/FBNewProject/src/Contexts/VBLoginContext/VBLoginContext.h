//
//  VBLoginContext.h
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@class VBArrayModel;

@interface VBLoginContext : VBModel
@property (nonatomic, strong) VBArrayModel *friendsArray;

- (instancetype)initWithUserID:(NSString *)userID;

@end
