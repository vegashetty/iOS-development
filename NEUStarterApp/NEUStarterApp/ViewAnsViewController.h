//
//  ViewAnsViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAnsViewController : UIViewController
@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSMutableString *answers;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
