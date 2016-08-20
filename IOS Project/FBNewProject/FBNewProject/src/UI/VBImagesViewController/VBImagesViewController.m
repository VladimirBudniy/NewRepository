//
//  VBImagesViewController.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImagesViewController.h"
#import "VBArrayMOdel.h"
#import "VBCollectionViewCell.h"
#import "VBImagesView.h"
#import "VBImagesContext.h"

static NSString * const kVBNavigationItemText = @"Photos";

@interface VBImagesViewController ()
@property (nonatomic, readonly) VBImagesView *rootView;

@end

@implementation VBImagesViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBImagesView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

-(void)setUser:(VBDataUser *)user {
    [super setUser:user];
    
    self.context = [[VBImagesContext alloc] initWithUser:user];
}

- (void)setArrayModel:(VBArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        
        VBImagesView *rootView = self.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.collectionView reloadData];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    
    NSString *className = NSStringFromClass([VBCollectionViewCell class]);
    [self.rootView.collectionView registerNib:[UINib nibWithNibName:className bundle:nil]
                   forCellWithReuseIdentifier:className];
}

#pragma mark - 
#pragma mark Public

- (void)successLoadObject:(VBDataUser *)object {
    self.arrayModel = [VBArrayModel arrayModelWithArray:object.imagesArray];
}

- (void)faildLoadObject:(VBDataUser *)object {
    self.arrayModel = [VBArrayModel arrayModelWithArray:object.imagesArray];
}

#pragma mark -
#pragma mark UICollectionViewDelegate Protocol

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.arrayModel.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = NSStringFromClass([VBCollectionViewCell class]);
    VBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:className
                                                                           forIndexPath:indexPath];
    [cell fillWithModel:self.arrayModel[indexPath.row]];
    
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

@end
