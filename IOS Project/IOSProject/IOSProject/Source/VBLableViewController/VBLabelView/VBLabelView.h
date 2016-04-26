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
@property (nonatomic, retain) IBOutlet UIView *upperView;
@property (nonatomic, retain) IBOutlet UILabel *label;

- (void)moveLabelaWithAnimation:(BOOL)animation;

@end
