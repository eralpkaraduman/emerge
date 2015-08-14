//
//  Message.m
//  Messenger
//
//  Created by Ignacio Romero Z. on 1/16/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import "Message.h"
#include "User.h"

@implementation Message

- (instancetype)initWithUser:(User *)user text:(NSString *)text
{
    self = [super init];

    if (!self) {
        return nil;
    }

    _user = user;
    _text = text;

    return self;
}
@end
