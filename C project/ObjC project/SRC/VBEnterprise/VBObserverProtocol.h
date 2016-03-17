//
//  VBObserverProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VBObserverProtocol <NSObject>

// methods for VBCar
@optional
- (void)carWashed:(id)car;
- (void)carSolied:(id)car;

// methods for VBCar
- (void)employeeBecameFree:(id)employee;
- (void)employeeBecameBusy:(id)employee;
- (void)employeeNowStandby:(id)employee;

@end
