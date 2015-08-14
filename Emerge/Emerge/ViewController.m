//
//  ViewController.m
//  Emerge
//
//  Created by Eralp Karaduman on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "ViewController.h"
#import <ALView+PureLayout.h>
#import "PushNotificationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *registerPushButton = [[UIButton alloc] initForAutoLayout];
    [self.view addSubview:registerPushButton];
    [registerPushButton autoCenterInSuperview];
    
    [registerPushButton setTitle:@"Register For Push" forState:UIControlStateNormal];
    [registerPushButton addTarget:self action:@selector(onTappedRegisterPushButton) forControlEvents:UIControlEventTouchUpInside];
    [registerPushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerPushButton setBackgroundColor:[UIColor lightGrayColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPushNotificationReceived:) name:PushNotificationManagerDidReceiveNotification object:nil];
}

- (void)onPushNotificationReceived:(NSNotification *)notification {
    
    NSDictionary *pushNotificationData = notification.userInfo;
    NSLog(@"push n : %@",pushNotificationData);
    
    [[[UIAlertView alloc] initWithTitle:nil message:@"received push" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    
}

- (void)onTappedRegisterPushButton {
    [[PushNotificationManager sharedManager] registerForNotifications];
}

@end
