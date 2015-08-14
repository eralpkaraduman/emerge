//
//  CurrentUser.h
//  Emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class User;

@interface CurrentUser : NSObject

@property (nonatomic) User *profile;
@property (nonatomic) CLLocation *location;
@property (nonatomic) NSString *devicePushToken;

+ (instancetype)currentUser;

@end
