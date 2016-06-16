//
//  VBViewController.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VBContext;
@class VBUser;

@interface VBViewController : UIViewController
@property (nonatomic, readonly) NSString * barTitle;
@property (nonatomic, readonly) NSString * leftButtonName;
@property (nonatomic, readonly) NSString * rightButtonName;

@property (nonatomic, strong)   VBContext   *context;
@property (nonatomic, strong)   VBUser      *user;

- (void)showNavigationBar;
- (void)hideNavigationBar;

- (void)successLoadObject:(id)object;
- (void)faildLoadObject:(id)object;

@end
