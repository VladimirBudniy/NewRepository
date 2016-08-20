//
//  VBDelegatingObject.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VBDelegatingObject;

@protocol VBDelegatingObjectProtocol <NSObject>
@required
- (void)sayMama:(VBDelegatingObject *)object;

@optional
- (void)sayPapa:(VBDelegatingObject *)object;

@end

@interface VBDelegatingObject : NSObject
@property (nonatomic, assign) id<VBDelegatingObjectProtocol> delegate;
@property (nonatomic, copy)   NSString *name;

@end
