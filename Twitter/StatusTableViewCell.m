//
//  StatusTableViewCell.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "StatusTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface StatusTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textHeight;
@property (weak, nonatomic) IBOutlet UILabel *retweetText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textConstraintHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeight;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgConstraintHeight;
@property (weak, nonatomic) IBOutlet UIImageView *retweetImage;
@end

@implementation StatusTableViewCell

- (void)awakeFromNib {
    self.content.preferredMaxLayoutWidth = self.content.frame.size.width;
    // Initialization code
//    self.description.text = @"Also, I tested your code (the top block) compared to Georg's, both in the simulator. You want to know the difference? His was 72 times faster. How is that not noticeable? Why would you use less readable, considerably slower code? You didn't even test your code before trying to disprove my accusations, did you? Please stop throwing silly notions around without evidence to back them up.";
}

- (void) setTweet:(Tweet *)tweet {
    self.title.text = tweet.user.name;
    self.handle.text = tweet.user.screenName;
    self.content.text = tweet.text;
    self.date.text = [NSString stringWithFormat:@"%@", tweet.createdAt];
    [self.image setImageWithURL:[NSURL URLWithString:tweet.user.profileImageUrl]];
    
    if (tweet.retweetPerson) {
        self.retweetText.text = [NSString stringWithFormat:@"%@ retweeted", tweet.retweetPerson];
    } else {
        //Resize the cell when the retweet status is gone.
        self.imgConstraintHeight.constant = 0.f;
        self.imgHeight.constant = 0.f;
        self.textHeight.constant = 0.f;
        self.textConstraintHeight.constant = 0.f;
        self.retweetText.hidden = YES;
        self.retweetImage.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // This is to fix some bug that sometimes autolayout causing text in label doesn't wrap properly
    self.content.preferredMaxLayoutWidth = self.content.frame.size.width;
}

@end
