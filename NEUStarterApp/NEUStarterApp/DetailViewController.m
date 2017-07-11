//
//  DetailViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 11/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "DetailViewController.h"
@import Parse;
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailDescriptionLabel,course,courseName,profName,courseRating,courseResources,courseReviews;

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    courseName.text = course.name;
    profName.text = course.professorName;
    courseReviews.text = course.comments;
    courseRating.text = [course.rating stringValue];
    courseResources.text = course.resources;

    // Do any additional setup after loading the view.
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
- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

@end
