//
//  StudentForumViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "StudentForumViewController.h"
#import "SWRevealViewController.h"
#import "ViewPostsTableViewController.h"

@interface StudentForumViewController ()

@end

@implementation StudentForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.image = [UIImage imageNamed:@"discussion-forum.png"];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
