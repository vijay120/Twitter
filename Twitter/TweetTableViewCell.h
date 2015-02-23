//
//  TweetTableViewCell.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/21/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetTableViewCell : UITableViewCell

@property (nonatomic, strong) Tweet *tweet;

@end
