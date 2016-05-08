//
//  UINib+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UINib+VBCategory.h"

@implementation UINib (VBCategory)

#pragma mark - 
#pragma mark Class Methods

+ (id)cellFromNibWithClacc:(Class)theClass {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([theClass class]) bundle:[NSBundle mainBundle]];
    for (id cell in [nib instantiateWithOwner:self options:nil]) {
        if ([cell isMemberOfClass:[theClass class]]) {
            return cell;
        }
    }
    
    return  nil;
}

@end