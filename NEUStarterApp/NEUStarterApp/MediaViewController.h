//
//  MediaViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 15/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryViewController.h"

@interface MediaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *viewGalleryButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *addressText;

@property (weak, nonatomic) IBOutlet UITextView *emailText;
@property (weak, nonatomic) GalleryViewController *gallery;

@property (weak, nonatomic) IBOutlet UITextView *phoneText;
- (IBAction)viewGallery:(id)sender;

@end
