//
//  VBQueue.h
//  C project
//
//  Created by Vladimir Budniy on 04.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBQueue : NSObject
@property (nonatomic, readonly) NSArray *queue;

-(void)pushObject:(id)object;
-(id)popObject;

@end
