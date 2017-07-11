//
//  CourseTableViewController.m
//  test2
//
//  Created by Vega  on 07/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "CourseTableViewController.h"
#import "SWRevealViewController.h"
#import "DetailViewController.h"
@import Parse;
@interface CourseTableViewController ()

@end

@implementation CourseTableViewController
@synthesize course, courseReviewsList,tableViewObject,detailViewController,searchController,searchResult;

-(void)getCourseReviewsList{
    courseReviewsList = [[NSMutableArray alloc] init];

PFQuery *query = [PFQuery queryWithClassName:@"Course"];
[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    if (!error) {
// 
[courseReviewsList addObjectsFromArray:objects];
//                NSLog(@"lalalal%@",courseReviewsList);
        //    }];
        // courseReviewsList = objects;
        // The find succeeded. The first 100 objects are available in objects
        NSLog(@"Successfully retrieved: %@", objects);
        NSMutableArray<Course *> *courseList =[[NSMutableArray alloc]init];
        for (PFObject *p in objects) {
            course = [[Course alloc]init];
            course.name  = [p valueForKey:@"name"];
            course.professorName = [p valueForKey:@"professorName"];
            course.resources = [p valueForKey:@"resources"];
            course.comments = [p valueForKey:@"comments"];
            course.rating = [p valueForKey:@"rating"];
            [courseList addObject:course];

        }

        self.courseReviewsList = courseList;
        [self.tableView reloadData];

    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    courseReviewsList = [[NSMutableArray alloc] init];
//
//    [self getCourseReviewsList];
//
//}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self getCourseReviewsList];

    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;

    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
   

    UINavigationController *searchResultsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"TableSearchResult"];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,
                                                       self.searchController.searchBar.frame.origin.y,
                                                       self.searchController.searchBar.frame.size.width, 44.0);
    self.tableViewObject.tableHeaderView = self.searchController.searchBar;
    
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    // Set searchString equal to what's typed into the searchbar
    NSString *searchString = self.searchController.searchBar.text;
    [self updateFilteredContentForSearch:searchString];
    if(self.searchController.searchResultsController){
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        // Present SearchResultsTableViewController as the topViewController
        CourseTableViewController *mvc = (CourseTableViewController *)navController.topViewController;
        // Update searchResults
        
        mvc.courseReviewsList = self.searchResult;
        // And reload the tableView with the new data
        [mvc.tableViewObject reloadData];
    }
}
- (void)updateFilteredContentForSearch:(NSString *)searchCourse
{if (searchCourse == nil) {
    // If empty the search results are the same as the original data
    self.searchResult = [self.courseReviewsList mutableCopy];
} else {
    NSMutableArray *searchResults1 = [[NSMutableArray alloc] init];
    // Else if the vehicles name is
    for (Course *course in self.courseReviewsList) {
        if ([course.name.lowercaseString containsString:searchCourse.lowercaseString]) {
            [searchResults1 addObject:course];
        }
        self.searchResult = searchResults1;
    }
}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {

        
            self.detailViewController = segue.destinationViewController;

            self.detailViewController.course = self.course;
        }
//}
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.courseReviewsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
    NSInteger *row = [indexPath row];
    
    Course *obj = [courseReviewsList objectAtIndex:row];
    
    self.course = obj;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = obj.name;
    cell.detailTextLabel.text =[obj.rating stringValue];

    return cell;
}

//
//
////    cell.textLabel.text = [object description];
////    return cell;
//
////
////
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
//
//
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [courseReviewsList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger sourceIndex = [fromIndexPath row];
    NSUInteger targetIndex = [toIndexPath row];
    
    if(sourceIndex != targetIndex)
    {
        [[self courseReviewsList] exchangeObjectAtIndex:sourceIndex withObjectAtIndex:targetIndex];
    }
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Cell is tapped");
    Course *course = [courseReviewsList objectAtIndex:indexPath.row];
    self.course = course;
    [self performSegueWithIdentifier:@"showDetail" sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 2){
        return NO;
    }
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



@end
