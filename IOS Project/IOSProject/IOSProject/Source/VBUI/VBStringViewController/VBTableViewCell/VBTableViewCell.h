//
//  VBTableViewCell.h
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VBImageView;

@interface VBTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIView                  *backgroundCellView;
@property (nonatomic, strong) IBOutlet UILabel                 *cellLabel;
@property (nonatomic, strong) IBOutlet UIView                  *separatorView;
@property (nonatomic, strong) IBOutlet VBImageView             *cellImage;

- (void)fillWithModel:(id)theModel;

@end
