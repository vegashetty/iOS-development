//
//  MainViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 10/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    _imageView.image = [UIImage imageNamed:@"camp.jpg"];
    _textView.text = @"Welome to the Northeastern Starter App! This application aims to help all prospective Huskies to get a glimpse of life at Northeastern. From course reviews, discussion topics and pictures, we got it all.\n\nSo go ahead and explore!";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.sidebarButton.tintColor = [UIColor whiteColor];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
