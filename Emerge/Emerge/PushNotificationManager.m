//
//  PushNotificationManager.m
//  emerge
//
//  Created by Eralp Karaduman on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

@import UIKit;

#import "PushNotificationManager.h"

@interface PushNotificationManager()
@property (strong,nonatomic) UIApplication *application;
@end

@implementation PushNotificationManager

+ (instancetype)sharedManager {
    static PushNotificationManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[PushNotificationManager alloc] init];
    });
    
    return _sharedManager;
}

- (instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [PushNotificationManager sharedManager].application = application;
    
}

- (void)registerForNotifications {
    
    UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeBadge |
                                    UIUserNotificationTypeSound);
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [_application registerUserNotificationSettings:settings];
}

+ (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    
    NSLog(@"p id %@",identifier);
    
}

+ (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"p reg %@",deviceToken);
}

+ (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"p fail e %@",error.description);
}

+ (void)didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
    [[PushNotificationManager sharedManager].application registerForRemoteNotifications];
}

@end
