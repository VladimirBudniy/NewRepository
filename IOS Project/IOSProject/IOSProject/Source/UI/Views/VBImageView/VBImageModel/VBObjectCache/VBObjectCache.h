//
//  VBObjectCache.h
//  IOSProject
//
//  Created by Vladimir Budniy on 31.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBObjectCache : NSObject <NSCoding>

- (void)setObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;
- (id)objectForKey:(id)key;

@end
