//
//  VBContext.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 12.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"
#import "VBDataUser.h"
#import "VBConstants.h"

@class VBDataUser;

@interface VBContext : VBModel
@property (nonatomic, strong)   VBDataUser     *user;
@property (nonatomic, readonly) NSDictionary   *requestParameters;

- (instancetype)initWithUser:(VBDataUser *)user;
- (void)cancel;

//must be changed in subclass
- (id)fillWithObject:(id)object;
- (void)performWorkWithResult:(id)result;

@end
