//
//  HousingViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"
@interface HousingViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *houseNames;
@property (strong, nonatomic) NSArray *houseImages;
@property (strong, nonatomic) NSArray *houseDescription;

- (IBAction)startButton:(id)sender;


@end
