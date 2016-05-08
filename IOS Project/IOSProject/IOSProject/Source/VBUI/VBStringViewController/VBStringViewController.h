//
//  VBStringViewController.h
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBArrayStringsModel.h"

@interface VBStringViewController : UIViewController
@property (nonatomic, strong) VBArrayStringsModel *stringsModel;

- (IBAction)onUpdateCells:(id)sender;

@end
