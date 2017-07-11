//
//  ViewPostsTableViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentForum.h"
#import "PostAnsViewController.h"

@class PostAnsViewController;
@interface ViewPostsTableViewController : UITableViewController

@property (retain, nonatomic) StudentForum *sForum;
@property (strong, nonatomic) NSMutableArray *sForumList;
@property (nonatomic,retain) PostAnsViewController *postAns;
- (IBAction)backButton:(id)sender;


@end
