//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBDataUser.h"
#import "VBImageView.h"

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBDataUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.first_name, user.last_name];
    self.cellLabel.text = name;
    self.cellImage.URL = [NSURL URLWithString:user.urlString];
}

@end
