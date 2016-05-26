//
//  VBImageView.h
//  IOSProject
//
//  Created by Vladimir Budniy on 26.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VBImageModel;

@interface VBImageView : UIView
@property (nonatomic, strong)     VBImageModel   *model;
@property (nonatomic, strong)     NSString       *url;

@end
