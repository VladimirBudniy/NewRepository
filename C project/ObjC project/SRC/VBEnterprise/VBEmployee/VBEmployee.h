//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBMoneyProtocol.h"
#import "VBDelegateProtocol.h"
#import "VBEnterprise.h"
#import "VBCar.h"

@interface VBEmployee : NSObject <VBMoneyProtocol, VBDelegateProtocol>;

@end
