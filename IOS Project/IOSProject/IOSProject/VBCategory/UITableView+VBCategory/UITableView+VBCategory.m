//
//  UITableView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UITableView+VBCategory.h"

@implementation UITableView (VBCategory)

#pragma mark -
#pragma mark Public

- (UITableViewCell *)dequeueReusableCellWithClass:(Class)theClass {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass([theClass class])];
    }
    
    return cell;
}

- (id)dequeueReusableCellFromNibWithClass:(Class)theClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        cell = [UINib objectFromNibWithClass:[theClass class]];
    }
    
    return cell;
}

- (id)dequeueReusableCellWithBundleClass:(Class)theClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        NSBundle *bundle = [NSBundle mainBundle];
        cell = [[bundle loadNibNamed:NSStringFromClass([theClass class])
                               owner:self
                             options:nil] firstObject];
    }
    
    return cell;
}

@end
