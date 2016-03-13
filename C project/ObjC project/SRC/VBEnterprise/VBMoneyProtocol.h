//
//  VBMoneyProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 10.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VBMoneyProtocol <NSObject>
@property (nonatomic, assign) NSUInteger money;

- (NSUInteger)giveMoney;

@optional
- (void)takeMoney:(NSUInteger)money;

@end
