//
//  VBArrayStringsModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger kVBDefaultArrayCount;

@interface VBArrayStringsModel : NSObject
@property (nonatomic, strong) NSArray *arrayStrings;

- (instancetype)initWithArrayRandomStrings;

@end
