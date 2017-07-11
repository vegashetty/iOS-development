//
//  PageViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *descText;

@property NSString *imageFile;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)backButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *backgrndView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
