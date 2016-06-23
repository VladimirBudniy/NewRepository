//
//  VBImagesContext.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImagesContext.h"
#import "VBDataImage.h"

@implementation VBImagesContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kVBRequestImagesParameters;
}

#pragma mark -
#pragma mark Public

- (NSArray *)fillWithObject:(NSArray *)arrayDictionary {
    NSMutableArray *images = [NSMutableArray array];
    for (NSDictionary *album in arrayDictionary) {
        NSArray *photos = [album valueForKeyPath:kVBUserPhotosKeyPath];
        for (NSDictionary *photoDictionary in photos) {
            NSString *ID = [photoDictionary valueForKey:kVBIDKey];
            VBDataImage *dataImage = [VBDataImage objectWithID:ID];
            dataImage.urlString = [photoDictionary valueForKey:kVBPictureKey];
            
            [images addObject:dataImage];
        }
    }
    
     return images;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    VBDataUser *user = self.user;
    NSArray *array = [result valueForKeyPath:kVBUserAlbumsKeyPath];
    user.images = [NSSet setWithArray:[self fillWithObject:array]];
    [self setState:kVBModelLoadedState withObject:user];
}

@end