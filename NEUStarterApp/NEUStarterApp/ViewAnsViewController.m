//
//  ViewAnsViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "ViewAnsViewController.h"
@import Parse;
@interface ViewAnsViewController ()
@end

@implementation ViewAnsViewController
@synthesize question,textView,answers;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    NSLog(@"Gotcha: %@", question);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getData{
    PFQuery *query = [PFQuery queryWithClassName:@"QuestionAnswer"];
    [query whereKey:@"question" equalTo:question];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Error: %lu", (unsigned long)objects.count);


            NSMutableArray *answersArray =[[NSMutableArray alloc]init];

            for (PFObject *p in objects) {
//                //course = [[Course alloc]init];
//                for (int i = 0; i <= objects.count; i++)
//                {
//                    UITextView *myTextView = [[UITextView alloc] initWithFrame:CGRectMake(20,100 + x,100,100)];
//                    [self.view addSubview:myTextView];
//               myTextView.text  = [p valueForKey:@"answer"];
                    [answersArray addObject: [p valueForKey:@"answer"]];

            }
            answers = [NSMutableString string];
            for (int i = 0; i < answersArray.count; i++)
            {
                [answers appendString: [NSString stringWithFormat:@"%@\n",answersArray[i]] ];

            }
            
            textView.text = answers ;
//            self.courseReviewsList = courseList;
//            [self.tableView reloadData];
        
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
