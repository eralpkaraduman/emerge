//
//  CurrentUser.m
//  Emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "CurrentUser.h"

#import "User.h"

@implementation CurrentUser

+ (instancetype)currentUser
{
    static CurrentUser *_currentUser = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _currentUser = [CurrentUser new];
    });
    
    return _currentUser;
}

@end
