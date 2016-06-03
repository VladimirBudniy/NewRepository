//
//  VBStringView.h
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBViewModel.h"

@interface VBStringView : VBViewModel
@property (nonatomic, retain) IBOutlet UITableView  *tableView;
@property (nonatomic, retain) IBOutlet UIButton     *reloadButton;
@property (nonatomic, strong) IBOutlet UISwitch     *editingSwitch;

@end
