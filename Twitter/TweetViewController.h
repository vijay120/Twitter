//
//  TweetViewController.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface TweetViewController : UIViewController
- (void) setHandleFromSomewhere: (NSString *) handle;
@property (strong, nonatomic) User *user;
@end
