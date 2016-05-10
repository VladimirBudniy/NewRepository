//
//  VBStringViewController.h
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBArrayModel.h"

@interface VBStringViewController : UIViewController
@property (nonatomic, strong) VBArrayModel *arrayModel;

- (IBAction)onUpdateCells:(id)sender;
- (IBAction)onStartEditing:(id)sender;

@end
