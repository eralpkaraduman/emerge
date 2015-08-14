//
//  UsernameViewController.m
//  emerge
//
//  Created by Ahmet Karalar on 14/08/15.
//  Copyright (c) 2015 Eralp Karaduman. All rights reserved.
//

#import "UsernameViewController.h"
#import "MessageViewController.h"

#import "User.h"
#import "CurrentUser.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UsernameViewController ()

@property (nonatomic) UIAlertController *alertController;
@property (nonatomic) UIAlertAction *okAction;

- (void)didChangeInput:(UITextField *)sender;

@end

@implementation UsernameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.alertController =
        [UIAlertController alertControllerWithTitle:@"Enter username"
                                            message:@"You should enter username to continue"
                                     preferredStyle:UIAlertControllerStyleAlert];
    @weakify(self);
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        @strongify(self);

        textField.placeholder = @"Username";
        [textField addTarget:self
                      action:@selector(didChangeInput:)
            forControlEvents:UIControlEventEditingChanged];
    }];

    self.okAction = [UIAlertAction
        actionWithTitle:@"OK"
                  style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                    @strongify(self);

                    UITextField *usernameField = [self.alertController.textFields firstObject];
                    User *user = [User new];
                    user.username = usernameField.text;
                    
                    CurrentUser *currentUser = [CurrentUser currentUser];
                    currentUser.profile = user;

                    MessageViewController *controller = [MessageViewController new];
                    [self.navigationController pushViewController:controller animated:YES];
                }];

    self.okAction.enabled = NO;
    [self.alertController addAction:self.okAction];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)didChangeInput:(UITextField *)sender
{
    if (self.alertController) {
        UITextField *textField = [self.alertController.textFields firstObject];
        self.okAction.enabled = textField.text.length > 2;
    }
}

@end
