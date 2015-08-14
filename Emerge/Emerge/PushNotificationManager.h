//
//  PushNotificationManager.h
//  emerge
//
//  Created by Eralp Karaduman on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const PushNotificationManagerDidReceiveNotification = @"PushNotificationManagerDidReceiveNotification";

static NSString * const PushNotificationManagerDidReceiveDeviceToken = @"PushNotificationManagerDidReceiveDeviceToken";

@interface PushNotificationManager : NSObject

+ (instancetype)sharedManager;

- (void)registerForNotifications;


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (void)didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;

+ (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo;

+ (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

+ (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

+ (void)didReceiveRemoteNotification:(NSDictionary *)userInfo;

@end
