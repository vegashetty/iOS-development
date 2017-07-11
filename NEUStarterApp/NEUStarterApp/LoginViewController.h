//
//  LoginViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 10/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) MainViewController *mvc;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

- (IBAction)loginControl:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)loginButton:(id)sender;
- (IBAction)registerButton:(id)sender;
@end
