//
//  AddCourseViewController.h
//  test2
//
//  Created by Vega  on 07/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "CourseTableViewController.h"
@interface AddCourseViewController : UIViewController
{
    NSMutableArray<Course *> *courseReviewsList;
}
@property (retain, nonatomic) NSMutableArray *courseReviewsList;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@property (weak, nonatomic) IBOutlet UITextField *courseName;
@property (weak, nonatomic) IBOutlet UITextField *professorName;
@property (weak, nonatomic) IBOutlet UITextField *courseRating;
@property (weak, nonatomic) IBOutlet UITextField *courseReview;
@property (weak, nonatomic) IBOutlet UITextField *courseResource;
- (IBAction)addCourseReview:(id)sender;
- (IBAction)backButton:(id)sender;
@property (nonatomic, retain) CourseTableViewController *cvc;

//@property (strong, nonatomic) FIRDatabaseReference *ref;

@end
