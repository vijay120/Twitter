//
//  ActionTableViewCell.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "ActionTableViewCell.h"
#import "TwitterClient.h"
#import "TweetViewController.h"

@interface ActionTableViewCell() <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *reply;
@property (weak, nonatomic) IBOutlet UIImageView *retweet;
@property (weak, nonatomic) IBOutlet UIImageView *favorite;
@end

@implementation ActionTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.retweet.userInteractionEnabled = YES;
    self.favorite.userInteractionEnabled = YES;
    self.reply.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedTweet:)];
    tapGestureRecognizer1.delegate = self;
    
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedFavorite:)];
    tapGestureRecognizer2.delegate = self;
    
    [self.retweet addGestureRecognizer:tapGestureRecognizer1];
    [self.favorite addGestureRecognizer:tapGestureRecognizer2];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)tappedFavorite:(UITapGestureRecognizer *)tap {
    NSDictionary *params = @{@"id" : self.tweet.statusId};
    [[TwitterClient sharedInstance] postFavorite:params complete:^(NSError *error) {
        if (error != nil) {
            [self.favorite setImage:[UIImage imageNamed:@"favorite_on.png"]];
        }
    }];
}

-(void)tappedTweet:(UITapGestureRecognizer *)tap {
    NSDictionary *params = @{@"id" : self.tweet.statusId};
    [[TwitterClient sharedInstance] postRetweet:params complete:^(NSError *error) {
        if (error != nil) {
            [self.retweet setImage:[UIImage imageNamed:@"retweet_on.png"]];
        }
    }];}

- (IBAction)tapGesture:(id)sender {
}
@end
