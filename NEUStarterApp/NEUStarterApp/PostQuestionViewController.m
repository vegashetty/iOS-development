//
//  PostQuestionViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "PostQuestionViewController.h"
@import Parse;
@interface PostQuestionViewController ()

@end

@implementation PostQuestionViewController
@synthesize course,topic,question,questionList;
- (void)viewDidLoad {
    [super viewDidLoad];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postButton:(id)sender {
    
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];

    if ([[question.text stringByTrimmingCharactersInSet: set] length] == 0 || [[topic.text stringByTrimmingCharactersInSet: set] length] == 0 || [[course.text stringByTrimmingCharactersInSet: set] length] == 0 )
    {
        [self giveErrorAlert: [NSString stringWithFormat: @"Check for empty fields!"]];
    }
    else{
    PFObject *sfObject = [PFObject objectWithClassName:@"StudentForum"];
    sfObject[@"question"] = question.text;
    sfObject[@"topic"] = topic.text;
    sfObject[@"course"] = course.text;
    sfObject[@"userId"] = [PFUser currentUser].objectId;
    
    [sfObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your course review has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            question.text = @"";
            topic.text = @"";
            course.text = @"";
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
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

- (IBAction)backButton:(id)sender {
        [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    
}
@end
