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
@property (nonatomic, strong) IBOutlet UILabel *label;

- (void)moveLabel;
- (void)animateLabel;

@end
