//
//  VBManagedObject.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 19.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "IDPActiveRecordKit.h"

@interface VBManagedObject : NSManagedObject
@property (nonatomic, strong) NSString *ID;

+ (instancetype)objectWithID:(NSString *)ID;
+ (instancetype)findObjectWithID:(NSString *)ID;

@end
