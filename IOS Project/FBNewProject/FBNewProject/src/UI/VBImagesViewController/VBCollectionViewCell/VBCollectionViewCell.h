//
//  VBCollectionViewCell.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 22.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VBImageView;
@class VBDataUser;

@interface VBCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet VBImageView             *cellImage;

- (void)fillWithModel:(VBDataUser *)user;

@end
