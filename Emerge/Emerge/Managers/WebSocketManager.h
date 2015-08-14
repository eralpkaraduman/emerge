//
//  WebSocketManager.h
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Message;
@protocol WebSocketManagerDelegate;

@interface WebSocketManager : NSObject

@property (nonatomic, weak) id<WebSocketManagerDelegate> delegate;

+ (instancetype)sharedManager;

- (void)startListening;
- (void)stopListening;

- (void)sendMessageWithText:(NSString *)text;

@end


@protocol WebSocketManagerDelegate <NSObject>

- (void)webSocketManager:(WebSocketManager *)manager didReceiveMessage:(Message *)message;

@end
