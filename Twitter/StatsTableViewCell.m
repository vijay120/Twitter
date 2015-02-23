//
//  StatsTableViewCell.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "StatsTableViewCell.h"

@interface StatsTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *favoritesCount;
@end

@implementation StatsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) setTweet:(Tweet *)tweet {
    self.retweetCount.text = [NSString stringWithFormat:@"%@", tweet.replyCount];
    self.favoritesCount.text = [NSString stringWithFormat:@"%@", tweet.favoritesCount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
