//
//  ViewPostsTableViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "ViewPostsTableViewController.h"
#import "PostsTableViewCell.h"
#import "SWRevealViewController.h"
@import Parse;
@interface ViewPostsTableViewController ()
{
    NSMutableArray *questionArray;
    NSMutableArray *topicArray;
    NSMutableArray *courseArray;
    NSArray *cardSizeArray;
}
@end

@implementation ViewPostsTableViewController
@synthesize sForum,sForumList,postAns;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];

  
    
}
-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getData{
    questionArray = [[NSMutableArray alloc] init];
    topicArray = [[NSMutableArray alloc] init];

    courseArray = [[NSMutableArray alloc] init];
    sForumList = [[NSMutableArray alloc] init];

    
    PFQuery *query = [PFQuery queryWithClassName:@"StudentForum"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
      
            NSLog(@"Successfully retrieved: %@", objects);
          NSMutableArray<StudentForum *> *sfList =[[NSMutableArray alloc]init];
            for (PFObject *p in objects) {
                sForum = [[StudentForum alloc]init];
                sForum.question  = [p valueForKey:@"question"];
                sForum.topic = [p valueForKey:@"topic"];
                sForum.course = [p valueForKey:@"course"];
                               [sfList addObject:sForum];
                [questionArray addObject:sForum.question];
                [topicArray addObject:sForum.topic];

                [courseArray addObject:sForum.course];

            }
            cardSizeArray = [[NSArray alloc]initWithObjects:@200,@200,@300,@300, nil];
            self.sForumList = sfList;
            [self.tableView reloadData];

//            self.courseReviewsList = courseList;
//            [self.tableView reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [((NSNumber*)[cardSizeArray objectAtIndex:indexPath.row])intValue];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.sForumList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cardViewCell"];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[PostsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cardViewCell"];
    }
    
   
    cell.topicLabel.text = [topicArray objectAtIndex:indexPath.row];
    cell.questionLabel.text = [questionArray objectAtIndex:indexPath.row];
    cell.courseLabel.text = [courseArray objectAtIndex:indexPath.row];

    NSLog(@"%ld",(long)indexPath.row);

    //%%% I made the cards pseudo dynamic, so I'm asking the cards to change their frames depending on the height of the cell
//    cell.postsView.frame = CGRectMake(10, 5, 300, [((NSNumber*)[cardSizeArray objectAtIndex:indexPath.row])intValue]-10);
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentForum *sF = [sForumList objectAtIndex:indexPath.row];
    self.sForum = sF;
    [self performSegueWithIdentifier:@"showDetail" sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {

        self.postAns = segue.destinationViewController;
        self.postAns.sForum = self.sForum;

        self.postAns.studentForumList = self.sForumList;
    }
    //}
    //        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //        controller.navigationItem.leftItemsSupplementBackButton = YES;
    //    }
}


- (IBAction)backButton:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}
@end
