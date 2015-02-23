//
//  ActionTableViewCell.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface ActionTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>
@property (nonatomic, strong) Tweet *tweet;
@end
