//
//  StudentForumViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentForumViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)postTopic:(id)sender;
- (IBAction)viewDiscussion:(id)sender;

@end
