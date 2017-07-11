//
//  PostAnsViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewPostsTableViewController.h"
#import "ViewAnsViewController.h"
@class StudentForum;
@class ViewPostsTableViewController,ViewAnsViewController;
@interface PostAnsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *questionView;
@property (weak, nonatomic) IBOutlet UITextField *ansField;
@property (retain, nonatomic) StudentForum *sForum;
@property (nonatomic, retain) ViewPostsTableViewController *cvc;
@property (nonatomic, retain) ViewAnsViewController *vpc;

@property (strong, nonatomic) NSMutableArray *studentForumList;
- (IBAction)postAnswer:(id)sender;
- (IBAction)viewAnswers:(id)sender;

//@property (strong, nonatomic) ViewPostsTableViewController *vptvc;

@end
