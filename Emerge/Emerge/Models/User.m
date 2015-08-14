//
//  User.m
//  Emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "User.h"

@interface User ()

@end

@implementation User

+ (instancetype)currentUser
{
    static User *_currentUser = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _currentUser = [User new];
    });
    
    return _currentUser;
}

@end
