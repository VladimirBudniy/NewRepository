//
//  VBWokerProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 12.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VBWokerProtocol <NSObject>

- (void)workerDidFinishedWork:(id)object;

@end
