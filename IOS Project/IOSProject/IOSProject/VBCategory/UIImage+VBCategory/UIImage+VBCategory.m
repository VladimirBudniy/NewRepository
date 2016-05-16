//
//  UIImage+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 16.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIImage+VBCategory.h"

@implementation UIImage (VBCategory)

#pragma mark -
#pragma mark Class Methods

+ (UIImage *)imagePathWithName:(NSString *)name {
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
    
    return [self imageWithContentsOfFile:path];
}

@end
