//
//  VBTableViewCell.h
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIView                  *backgroundCellView;
@property (nonatomic, strong) IBOutlet UILabel                 *cellLabel;
@property (nonatomic, strong) IBOutlet UIView                  *separatorView;
@property (nonatomic, strong) IBOutlet UIImageView             *cellImage;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinner;


- (void)fillWithModel:(id)theModel;
- (void)fillWithModel:(id)theModel animated:(BOOL)animated;

@end
