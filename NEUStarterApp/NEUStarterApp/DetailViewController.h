//
//  DetailViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 11/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) Course *course;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *profName;
@property (weak, nonatomic) IBOutlet UILabel *courseRating;
@property (weak, nonatomic) IBOutlet UILabel *courseReviews;
@property (weak, nonatomic) IBOutlet UILabel *courseResources;

@end
