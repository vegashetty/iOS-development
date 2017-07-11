//
//  AddCourseViewController.m
//  test2
//
//  Created by Vega  on 07/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "AddCourseViewController.h"
#import "Course.h"
#import <Parse/Parse.h>
#import "NSString+InputString.h"
@interface AddCourseViewController ()

@end

@implementation AddCourseViewController
@synthesize courseName,courseRating,courseReview,courseResource,professorName,courseReviewsList;
- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];


    //self.ref = [[FIRDatabase database] reference];
    
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    PFQuery *query = [PFQuery queryWithClassName:@"Course"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [courseReviewsList addObjectsFromArray:objects];
            self.cvc = segue.destinationViewController;
            self.cvc.courseReviewsList = self.courseReviewsList;
            NSLog(@"checkkkkkkk %lu", (unsigned long)courseReviewsList.count);
            
            // courseReviewsList = objects;
            // The find succeeded. The first 100 objects are available in objects
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
  
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//- writeUserData(userId, name, email, imageUrl) {
//    firebase.database().ref('users/' + userId).set({
//    username: name,
//    email: email,
//        profile_picture : imageUrl
//    });
//}

- (IBAction)addCourseReview:(id)sender {
    // FIRUser *user = [FIRAuth auth].currentUser;
 
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    if ([[courseName.text stringByTrimmingCharactersInSet: set] length] == 0 || [[courseResource.text stringByTrimmingCharactersInSet: set] length] == 0 || [[courseRating.text stringByTrimmingCharactersInSet: set] length] == 0 || [[courseReview.text stringByTrimmingCharactersInSet: set] length] == 0 || [[professorName.text stringByTrimmingCharactersInSet: set] length] == 0)
    {
        [self giveErrorAlert: [NSString stringWithFormat: @"Check for empty fields!"]];
    }
    else if([courseRating.text doubleValue] > 10){
            [self giveErrorAlert: [NSString stringWithFormat: @"Enter number less than 10!"]];

    }
    else{
    Course *course = [[Course alloc] init];
    
    course.name = courseName.text;
    //double rating = courseRating.text.doubleValue;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:courseRating.text];
    course.rating = myNumber;

    course.resources = courseResource.text;
    course.professorName = professorName.text;
    course.comments = courseReview.text;
    
    PFObject *courseObject = [PFObject objectWithClassName:@"Course"];
    courseObject[@"name"] = course.name;
    courseObject[@"professorName"] = course.professorName;
    courseObject[@"rating"] = course.rating;
    courseObject[@"comments"] = course.comments;
    courseObject[@"resources"] = course.resources;
    courseObject[@"userId"] = [PFUser currentUser].objectId;
    
    [courseObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your course review has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
        courseRating.text = @"";
        courseResource.text = @"";
        courseReview.text = @"";
        courseName.text = @"";
        professorName.text = @"";}
}

- (IBAction)backButton:(id)sender {
     [self performSegueWithIdentifier:@"moveToList" sender:sender];
    
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
