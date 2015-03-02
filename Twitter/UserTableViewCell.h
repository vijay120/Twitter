//
//  UserTableViewCell.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 3/1/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserTableViewCell : UITableViewCell
@property (nonatomic, strong) User* user;
@end
