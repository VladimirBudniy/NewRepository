//
//  VBContext.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 12.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"
#import "VBUser.h"
#import "VBConstants.h"

@class VBUser;

@interface VBContext : VBModel
@property (nonatomic, strong)   VBUser         *user;
@property (nonatomic, readonly) NSDictionary   *requestParameters;

- (instancetype)initWithUser:(VBUser *)user;

@end
