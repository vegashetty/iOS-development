//
//  PostQuestionViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentForum.h"

@interface PostQuestionViewController : UIViewController
{
    NSMutableArray<StudentForum *> *questionList;
}
- (IBAction)backButton:(id)sender;
@property (retain, nonatomic) NSMutableArray *questionList;
@property (weak, nonatomic) IBOutlet UITextField *question;

@property (weak, nonatomic) IBOutlet UITextField *topic;
@property (weak, nonatomic) IBOutlet UITextField *course;
- (IBAction)postButton:(id)sender;

@end
