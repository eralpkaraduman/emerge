//
//  WebSocketManager.m
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "WebSocketManager.h"

#import <SocketRocket/SRWebSocket.h>

#import "Message.h"
#import "User.h"
#import "CurrentUser.h"

static NSString *const kHostURLString = @"http://52.5.104.99/msg";

@interface WebSocketManager () <SRWebSocketDelegate>

@property (nonatomic) SRWebSocket *socket;

@end

@implementation WebSocketManager

+ (instancetype)sharedManager
{
    static WebSocketManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _manager = [WebSocketManager new]; });

    return _manager;
}

- (void)startListening
{
    [self _reconnect];
}

- (void)_reconnect;
{
    [self _close];

    self.socket = [[SRWebSocket alloc]
        initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kHostURLString]]];
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
    Message *message = [Message new];
    message.text = text;
    message.user = [CurrentUser currentUser].profile;

    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:message error:nil];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self.socket send:string];
}

#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"message: %@", message);
    
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    Message *messageObject = [MTLJSONAdapter modelOfClass:[Message class] fromJSONDictionary:dict error:nil];

    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(webSocketManager:didReceiveMessage:)]) {
        [self.delegate webSocketManager:self didReceiveMessage:messageObject];
    }
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"socket did open");
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"socket did fail with error");
}

- (void)webSocket:(SRWebSocket *)webSocket
    didCloseWithCode:(NSInteger)code
              reason:(NSString *)reason
            wasClean:(BOOL)wasClean
{
    NSLog(@"socket did close. code: %lu, reason: %@, wasClean: %d", code, reason, wasClean);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
    NSLog(@"did receive ping");
}


@end
