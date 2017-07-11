//
//  CourseTableViewController.h
//  test2
//
//  Created by Vega  on 07/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "DetailViewController.h"

@interface CourseTableViewController : UITableViewController
//{
//    NSMutableArray<Course *> *courseReviewsList;
//}
@property (strong, nonatomic) IBOutlet UITableView *tableViewObject;
@property (retain, nonatomic) Course *course;
@property (strong, nonatomic) NSMutableArray *courseReviewsList;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) IBOutlet NSArray *searchResult;
@property (strong, nonatomic) DetailViewController *detailViewController;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItem;
-(void)getCourseReviewsList;

@end
