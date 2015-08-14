//
//  PushNotificationManager.h
//  emerge
//
//  Created by Eralp Karaduman on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushNotificationManager : NSObject

+ (instancetype)sharedManager;

- (void)registerForNotifications;


+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (void)didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;

+ (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler;

+ (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

+ (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;


@end
