//
//  VBLabelView.h
//  IOSProject
//
//  Created by Vladimir Budniy on 21.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VBLabelLocation : NSUInteger {
    kVBLabelUpperLeftLocation,
    kVBLabelUpperRightLocation,
    kVBLabelLowerRightLocation,
    kVBLabelLowerLeftLocation
} VBLabelLocation;

typedef void (^VBLabelHandler)(void);

@interface VBLabelView : UIView
@property (nonatomic, retain) IBOutlet UIView   *upperView;

@property (nonatomic, retain) IBOutlet UILabel  *label;
@property (nonatomic, retain) IBOutlet UILabel *animationLabel;
@property (nonatomic, retain) IBOutlet UILabel *stepLabel;

@property (nonatomic, retain) IBOutlet UIButton *moveLabelButon;

@property (nonatomic, retain) IBOutlet UISwitch *animationSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *stepSwitch;

- (void)moveLabel;
- (void)changeSwitchStatusName;

@end
