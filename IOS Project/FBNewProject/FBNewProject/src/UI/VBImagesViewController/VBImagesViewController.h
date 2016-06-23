//
//  VBImagesViewController.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

@class VBArrayModel;

@interface VBImagesViewController : VBViewController <UICollectionViewDelegate>
@property (nonatomic, strong) VBArrayModel   *arrayModel;

@end
