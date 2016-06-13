//
//  VBViewController.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBViewController : UIViewController
@property (nonatomic, readonly) NSString * barTitle;

- (void)navigationBarHidden:(BOOL)hidden leftButton:(NSString *)leftName rightButton:(NSString *)rightName;

@end
