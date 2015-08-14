//
//  SplashViewController.m
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "SplashViewController.h"
#import "PushNotificationSettingsViewController.h"

@implementation SplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    PushNotificationSettingsViewController *controller = [PushNotificationSettingsViewController new];
    [self.navigationController pushViewController:controller animated:NO];
}

@end
