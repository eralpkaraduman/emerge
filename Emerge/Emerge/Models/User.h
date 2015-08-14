//
//  User.h
//  Emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CLLocation.h>

@interface User : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) NSData *avatarImageData;
@property (nonatomic) CLLocation *location;


+ (instancetype)currentUser;

@end
