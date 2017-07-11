//
//  PostsTableViewCell.m
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "PostsTableViewCell.h"

@implementation PostsTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews
{
    [self cardSetup];
}

-(void)cardSetup
{
    [self.postsView setAlpha:1];
    self.postsView.layer.masksToBounds = NO;
    self.postsView.layer.cornerRadius = 1; // if you like rounded corners
    self.postsView.layer.shadowOffset = CGSizeMake(-.2f, .2f); //%%% this shadow will hang slightly down and to the right
    self.postsView.layer.shadowRadius = 1; //%%% I prefer thinner, subtler shadows, but you can play with this
    self.postsView.layer.shadowOpacity = 0.2; //%%% same thing with this, subtle is better for me
    
    //%%% This is a little hard to explain, but basically, it lowers the performance required to build shadows.  If you don't use this, it will lag
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.postsView.bounds];
    self.postsView.layer.shadowPath = path.CGPath;
    
    self.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1]; //%%% I prefer choosing colors programmatically than on the storyboard
}
- (void)awakeFromNib {
    //[super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)answer:(id)sender {
    NSLog(@"Successfully retrieved: %@", _questionLabel.text);

    
    
}

- (IBAction)viewAnswerButton:(id)sender {
}
@end
