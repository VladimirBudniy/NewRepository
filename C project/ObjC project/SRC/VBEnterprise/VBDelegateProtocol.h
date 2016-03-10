//
//  VBDelegateProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 10.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VBDelegateProtocol <NSObject>
@property (nonatomic, assign) id<VBDelegateProtocol> delegate;

@end
