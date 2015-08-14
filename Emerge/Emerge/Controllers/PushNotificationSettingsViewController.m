//
//  PushNotificationSettingsViewController.m
//  emerge
//
//  Created by Eralp Karaduman on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "PushNotificationSettingsViewController.h"
#import <ALView+PureLayout.h>
#import "PushNotificationManager.h"
#import "LocationPermissionViewController.h"

@interface PushNotificationSettingsViewController ()

@end

@implementation PushNotificationSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *button = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Enable Push Notifications" forState:UIControlStateNormal];
    [button autoCenterInSuperview];
    [button addTarget:self action:@selector(onTappedAllowPushButton) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onReceivedDeviceToken:) name:PushNotificationManagerDidReceiveDeviceToken object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        
        LocationPermissionViewController *locationPermissionVC = [LocationPermissionViewController new];
        [self.navigationController pushViewController:locationPermissionVC animated:YES];
        
    }
}

- (void)onReceivedDeviceToken:(NSNotification*)notification {
    
    NSString *deviceToken = [notification.object valueForKey:@"deviceToken"];
    NSLog(@"deviceToken %@",deviceToken);
    
    LocationPermissionViewController *locationPermissionVC = [LocationPermissionViewController new];
    [self.navigationController pushViewController:locationPermissionVC animated:YES];
    
}

- (void)onTappedAllowPushButton {
    [[PushNotificationManager sharedManager] registerForNotifications];
}

@end
