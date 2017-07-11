//
//  HousingViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "HousingViewController.h"
#import "SWRevealViewController.h"
@interface HousingViewController ()

@end

@implementation HousingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Create the data model
    _houseNames = @[@"Mission Hill apartments", @"Park Drive", @"Bolyston street", @"Cityview apts"];
    _houseImages = @[@"page1.jpg", @"page2.jpg", @"page3.jpg", @"page4.jpg"];
    _houseDescription = @[@"Mission hill apartments is a 10 minute walk from University. Manu Northeastern students prefer this location. Many stores nearby.", @"Park drive is known for its quite surroundings and a favourite among students for its apartments", @"Bolyston street is known for its happening surroundings and eatries in the vicinity.", @"Cityview is a known favourite among Indian graduate students, for its proximity to the University and excellent facilitie provided."];
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    PageViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.houseNames count] == 0) || (index >= [self.houseNames count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.houseImages[index];
    pageContentViewController.descText = self.houseDescription[index];

    pageContentViewController.titleText = self.houseNames[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.houseNames count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.houseNames count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
