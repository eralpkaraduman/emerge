//
//  LocationPermissionViewController.m
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "LocationPermissionViewController.h"
#import "UsernameViewController.h"
#import "User.h"

#import <PureLayout/PureLayout.h>
#import <HIPLocationManager/HIPLocationManager.h>

@implementation LocationPermissionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton = YES;

    UILabel *label = [UILabel new];
    label.text = @"Getting location...";
    [self.view addSubview:label];

    [label autoPinToTopLayoutGuideOfViewController:self withInset:100];
    [label autoAlignAxisToSuperviewAxis:ALAxisVertical];


    [[HIPLocationManager sharedManager] getLocationWithExecutionBlock:^(CLLocation *location,  //
                                                                        NSError *error) {

        User *user = [User currentUser];
        user.location = location;

        UsernameViewController *controller = [UsernameViewController new];
        [self.navigationController pushViewController:controller animated:YES];

    }];
}

@end
