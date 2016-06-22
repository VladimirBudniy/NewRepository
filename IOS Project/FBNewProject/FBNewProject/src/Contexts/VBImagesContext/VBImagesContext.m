//
//  VBImagesContext.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImagesContext.h"

@implementation VBImagesContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kVBRequestImagesParameters;
}

#pragma mark -
#pragma mark Public

- (NSArray *)fillWithObject:(NSDictionary *)dictionary {
    NSMutableArray *array = [NSMutableArray array];

    
    
    return array;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    VBDataUser *user = self.user;
//    NSArray *array = [result valueForKeyPath:kVBFriendsKeyPathKey];  ????? key !!!!!!
//    NSArray *friends = [NSArray arrayWithArray:[self fillWithObject:array]];
//    [user addFriendsArray:friends];
//    [user saveManagedObject];
    
    [self setState:kVBModelLoadedState withObject:user];
}

@end
