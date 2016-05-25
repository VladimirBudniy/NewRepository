//
//  VBImageModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@interface VBImageModel : VBModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL    *url;

+ (instancetype)imageModelWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
