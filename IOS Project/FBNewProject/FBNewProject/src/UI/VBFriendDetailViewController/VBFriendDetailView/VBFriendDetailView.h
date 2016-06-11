//
//  VBFriendDetailView.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 10.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"
#import "VBLoadingView.h"

@class VBUser;
@class VBImageView;

@interface VBFriendDetailView : VBViewModel
@property (nonatomic, strong) IBOutlet VBImageView *userImage;
@property (nonatomic, strong) IBOutlet UILabel     *userName;
@property (nonatomic, strong) IBOutlet UILabel     *userGender;
@property (nonatomic, strong) IBOutlet UILabel     *userFriendsCount;

- (void)fillWithUser:(VBUser *)user;

@end
