//
//  VBImageModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@interface VBImageModel : VBModel
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, strong) NSString    *url;

+ (instancetype)imageModelWithURL:(NSString *)url;

- (instancetype)initWithURL:(NSString *)url;

@end
