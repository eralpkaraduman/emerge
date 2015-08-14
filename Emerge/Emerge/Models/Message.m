//
//  Message.m
//  Messenger
//
//  Created by Ignacio Romero Z. on 1/16/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import "Message.h"
#import "User.h"
#import <Mantle/MTLJSONAdapter.h>

@interface Message () 

@end

@implementation Message

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{ @"user" : @"user", @"text" : @"text" };
}

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

+ (NSValueTransformer *)userJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSDictionary *dict,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:dict error:error];
    } reverseBlock:^id(User *user, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter JSONDictionaryFromModel:user error:error];
    }];
}

@end
