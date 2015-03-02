//
//  TweetTableViewCell.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/21/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "TweetTableViewCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"

@interface TweetTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *tweetImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetTextHeight;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UIImageView *retweetHoverOn;
@property (weak, nonatomic) IBOutlet UILabel *retweetText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heighConstraintText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heighConstraintImage;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightProperty;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetHeightProperty;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetTextBottomHeight1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetTextBottomHeight2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetTextBottomHeight3;

@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.text.preferredMaxLayoutWidth = self.text.frame.size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    [self.tweetImage setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageUrl]];
    self.text.text = self.tweet.text;
    self.handle.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.title.text = self.tweet.user.name;
    self.time.text = [self dateFormatter:self.tweet.createdAt];
    self.favoriteCount.text = [NSString stringWithFormat:@"%@", self.tweet.favoritesCount];
    self.retweetCount.text = [NSString stringWithFormat:@"%@", self.tweet.replyCount];
    
    if (self.tweet.retweetPerson) {
        self.retweetText.text = [NSString stringWithFormat:@"%@ retweeted", self.tweet.retweetPerson];
    } else {
        //Resize the cell when the retweet status is gone.
        self.heighConstraintImage.constant = 0.f;
        self.heighConstraintText.constant = 0.f;
        self.retweetHeightProperty.constant = 0.f;
        self.retweetTextHeight.constant = 0.f;
        self.retweetText.hidden = YES;
        self.retweetHoverOn.hidden = YES;
    }
}

-(NSString *)dateFormatter: (NSDate *) dateArg {
    NSDate *now = [[NSDate alloc] init];
    NSTimeInterval distanceBetweenDatesInSeconds = [now timeIntervalSinceDate:dateArg];
    
    if (distanceBetweenDatesInSeconds < 60) {
        //in seconds
        return [NSString stringWithFormat:@"%ld s", (long) distanceBetweenDatesInSeconds];
    } else if (distanceBetweenDatesInSeconds > 60 && distanceBetweenDatesInSeconds < 3600) {
        //in minutes
        int finalVal = (int)distanceBetweenDatesInSeconds / 60;
        return [NSString stringWithFormat:@"%d m", finalVal];
    } else if (distanceBetweenDatesInSeconds > 3600 && distanceBetweenDatesInSeconds < 3600*24) {
        //if less than a day
        int finalVal = (int)distanceBetweenDatesInSeconds / 3600;
        return [NSString stringWithFormat:@"%d h", finalVal];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //dateFromString = [dateFormatter dateFromString:dateArg];
        dateFormatter.dateFormat = @"MM-dd";
        NSString *newDateString = [dateFormatter stringFromDate:dateArg];
        return [NSString stringWithFormat:@"%@", newDateString];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // This is to fix some bug that sometimes autolayout causing text in label doesn't wrap properly
    self.text.preferredMaxLayoutWidth = self.text.frame.size.width;
}

@end
