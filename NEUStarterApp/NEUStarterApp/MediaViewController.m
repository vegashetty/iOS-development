//
//  MediaViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 15/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "MediaViewController.h"
#import "SWRevealViewController.h"
@interface MediaViewController ()

@end

@implementation MediaViewController
@synthesize phoneText,addressText,emailText,webView,imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    phoneText.text = @"617.373.2000 ";
    addressText.text = @"360 Huntington Ave, Boston, MA 02115";
    emailText.text = @"help@northeastern.edu";
imageView.image = [UIImage imageNamed:@"northeastern-university.png"];

    NSString *urlString = @"http://www.northeastern.edu";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    [self.view addSubview:self.webView];

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

//- (IBAction)viewGallery:(id)sender {
//   
//    UINavigationController *passcodeNavigationController = [[UINavigationController alloc] initWithRootViewController:self.gallery];
//    // [self.navigationController presentModalViewController:passcodeNavigationController animated:YES];
//    [self.navigationController pushViewController:passcodeNavigationController animated:YES];
//}
@end
