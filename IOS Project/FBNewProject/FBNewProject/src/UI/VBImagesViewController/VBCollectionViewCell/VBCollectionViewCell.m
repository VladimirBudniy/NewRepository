//
//  VBCollectionViewCell.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 22.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBCollectionViewCell.h"
#import "VBDataUser.h"
#import "VBImageView.h"

@implementation VBCollectionViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(VBDataUser *)user {
    self.cellImage.URL = [NSURL URLWithString:user.urlString];
}

@end
