//
//  Message.h
//  Messenger
//
//  Created by Ignacio Romero Z. on 1/16/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class User;

@interface Message : NSObject

@property (nonatomic) User *user;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithUser:(User *)user text:(NSString *)text;

@end
