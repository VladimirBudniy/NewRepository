//
//  VBDataImage+CoreDataProperties.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 21.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBDataImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBDataImage (CoreDataProperties)

@property (nonatomic, strong) NSString   *urlString;
@property (nonatomic, strong) VBDataUser *user;

@end

NS_ASSUME_NONNULL_END
