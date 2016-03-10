//
//  VBEnterprise.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBDelegateProtocol.h"

@class VBCar;

@interface VBEnterprise : NSObject <VBDelegateProtocol, VBDelegateProtocol>

- (void)toWashCar:(VBCar *)car;

@end
