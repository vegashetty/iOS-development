//
//  PageViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "PageViewController.h"
#import "SWRevealViewController.h"
@interface PageViewController ()

@end


@implementation PageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.backgrndView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.textView.text = self.descText;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
     [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil]; 
}
@end
