//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBUser.h"
#import "VBImageView.h"

static NSString * const kVBLageImagePath = @"https://graph.facebook.com/%@/picture";

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBUser *)user {
    self.cellLabel.text = user.name;
    self.cellImage.URL = [NSURL URLWithString:[NSString stringWithFormat:kVBLageImagePath, user.userID]];
}

@end
