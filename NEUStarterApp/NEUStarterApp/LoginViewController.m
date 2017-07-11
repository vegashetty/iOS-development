//
//  LoginViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 10/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+InputString.h"
@import Parse;
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize mvc;

- (void)viewDidLoad {
    [super viewDidLoad];
    [_loginButton setHidden:YES];
    _logoView.image= [UIImage imageNamed:@"Northeastern_Huskies_logo.png"];
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    // Do any additional setup after loading the view.
}
-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
if([self returnWithoutWhiteSpaces:textField.text] !=nil){
UIResponder *newResponder = [textField.superview viewWithTag:textField.tag+1];
if(newResponder) {
[newResponder becomeFirstResponder];
}else {
   [textField resignFirstResponder];
 }}else {[textField becomeFirstResponder];
     UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];}
}

-(NSString *) returnWithoutWhiteSpaces:(NSString *)myString {
    NSString *newString = [myString stringByReplacingOccurrencesOfString:@"\u200B" withString:@""];
    return newString;
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSString *email = _emailTextfield.text;
    NSString *password = _passwordTextfield.text;
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];

    if ([[email stringByTrimmingCharactersInSet: set] length] == 0 || [[password stringByTrimmingCharactersInSet: set] length] == 0)
    {
        [self giveErrorAlert: [NSString stringWithFormat: @"Field contains whitespace"]];
    
        
    return NO;
    }
    else if([email NSStringIsValidEmail:email] == false){
        
        [self giveErrorAlert: [NSString stringWithFormat: @"Must be in e-mail format only."]];
        return NO;
    }
    else if([password length] < 4 ){
        
        [self giveErrorAlert: [NSString stringWithFormat: @"Password must be more than 8 characters."]];
        return NO;
    }
    else{
            [PFUser logInWithUsernameInBackground:email password:password
                                            block:^(PFUser *user, NSError *error) {
                                                if (user) {
                                                    
                                                    //  [self performSegueWithIdentifier:@"mainSegue" sender:self];
                                                } else {
                                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Credentials provided were incorrect. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                    [alert show];
                                                    
                                                }
                                            }];
            
        

        
        return YES;
    }
}

- (IBAction)loginButton:(id)sender {

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier]isEqualToString:@"sw_rear"]){
        mvc = [segue destinationViewController];
    }
}
- (IBAction)registerButton:(id)sender {
    NSString *email = _emailTextfield.text;
    NSString *password = _passwordTextfield.text;
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    
    if ([[email stringByTrimmingCharactersInSet: set] length] == 0 || [[password stringByTrimmingCharactersInSet: set] length] == 0)
    {
        [self giveErrorAlert: [NSString stringWithFormat: @"Field contains whitespace"]];
        
            }
    else if([email NSStringIsValidEmail:email] == false){
        
        [self giveErrorAlert: [NSString stringWithFormat: @"Must be in e-mail format only."]];
    }
    else if([password length] < 4 ){
        
        [self giveErrorAlert: [NSString stringWithFormat: @"Password must be more than 8 characters."]];
    }
    else{

PFUser* user = [PFUser user];
user.username = _emailTextfield.text;
user.password = _passwordTextfield.text;
    user.email = _emailTextfield.text;


[user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
    
    if(!error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registered!" message:@"Registered." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

        // No problems so far
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Error." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

        NSString* errorString = [error userInfo][@"error"];
        // Something went wrong; the error string is in errorString
    }
}];
}
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginControl:(id)sender {
    
        UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
        NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
        
        if (selectedSegment == 0) {
            //toggle the correct view to be visible
            [_registerButton setHidden:NO];
            [_loginButton setHidden:YES];
        }
        else{
            //toggle the correct view to be visible
            [_registerButton setHidden:YES];
            [_loginButton setHidden:NO];
        }
    
}

- (void) giveErrorAlert : (NSString *) errorMessage{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Message"
                                                    message:errorMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
