//
//  PostsTableViewCell.h
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *postsView;
@property (weak, nonatomic) IBOutlet UILabel *topicLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
//- (IBAction)answerButton:(id)sender;
//@property (weak, nonatomic) IBOutlet UIButton *answer;
- (IBAction)answer:(id)sender;

- (IBAction)viewAnswerButton:(id)sender;

@end
