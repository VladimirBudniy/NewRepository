//
//  VBManagedObject.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 19.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBManagedObject.h"

static NSString * const kVBIDKey = @"id";

@implementation VBManagedObject

@dynamic ID;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)objectWithID:(NSString *)ID {
    VBManagedObject *object = [self findObjectWithID:ID];
    if (object) {
        return object;
    }
    
    object = [self managedObject];
    object.ID = ID;
    
    return object;
}

+ (instancetype)findObjectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", kVBIDKey, ID];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil predicate:predicate prefetchPaths:nil] firstObject];;
}

#pragma mark -
#pragma mark Accessors

- (void)setID:(NSString *)ID {
    [self setCustomValue:ID forKey:kVBIDKey];
}

- (NSString *)ID {
    return [self customValueForKey:kVBIDKey];
}

@end
