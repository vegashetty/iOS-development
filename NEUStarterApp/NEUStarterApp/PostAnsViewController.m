//
//  PostAnsViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "PostAnsViewController.h"
#import "QuestionAnswer.h"
@import Parse;
@interface PostAnsViewController ()

@end

@implementation PostAnsViewController
@synthesize sForum,cvc,studentForumList,ansField,questionView;
- (void)viewDidLoad {
    [super viewDidLoad];
    //vptvc = [[ViewPostsTableViewController alloc]init];
    questionView.text = sForum.question;
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];

  //  NSLog(@"Successfully retrieved: %@", sForum.question);


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

- (IBAction)postAnswer:(id)sender {
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    if ([[ansField.text stringByTrimmingCharactersInSet: set] length] == 0)
    {
        [self giveErrorAlert: [NSString stringWithFormat: @"Check for empty fields!"]];
    }
    else{
    PFObject *sfObject = [PFObject objectWithClassName:@"QuestionAnswer"];
    sfObject[@"question"] = questionView.text;
    sfObject[@"answer"] = ansField.text;
    sfObject[@"userId"] = [PFUser currentUser].objectId;
    
    [sfObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Answer posted!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            ansField.text = @"";
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    }

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"viewAnswers"]) {
        
        self.vpc = segue.destinationViewController;
         NSLog(@"Successfully retrieved: %@", questionView.text);
 [(ViewAnsViewController *) [segue destinationViewController] setQuestion:self.questionView.text];
       // self.vpc.question = questionView.text;
        
    }
    //}
    //        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //        controller.navigationItem.leftItemsSupplementBackButton = YES;
    //    }
}

- (IBAction)viewAnswers:(id)sender {
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
