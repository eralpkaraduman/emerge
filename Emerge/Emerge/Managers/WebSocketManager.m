//
//  WebSocketManager.m
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "WebSocketManager.h"

#import <SocketRocket/SRWebSocket.h>

static NSString * const kHostURLString = @"http://52.5.104.99/msg";

@interface WebSocketManager () <SRWebSocketDelegate>

@property (nonatomic) SRWebSocket *socket;

@end

@implementation WebSocketManager

+ (instancetype)sharedManager
{
    static WebSocketManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [WebSocketManager new];
    });
    
    return _manager;
}

- (void)startListening
{
    [self _reconnect];
}

- (void)_reconnect;
{
    [self _close];
    
    self.socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kHostURLString]]];
    self.socket.delegate = self;
    
    NSLog(@"opening connection...");
    [self.socket open];
}

- (void)_close
{
    self.socket.delegate = nil;
    [self.socket close];
}


- (void)stopListening
{
    [self _close];
}

- (void)sendMessageWithText:(NSString *)text
{
    
}

#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
    
}


@end
