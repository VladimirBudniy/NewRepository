//
//  VBImagesView.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"

@class VBDataUser;

@interface VBImagesView : VBViewModel
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

- (void)fillWithUser:(VBDataUser *)user;

@end
