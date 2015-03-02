//
//  UserTableViewCell.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 3/1/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "UserTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface UserTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setUser:(User *)user {
    [self.image setImageWithURL:[NSURL URLWithString:user.profileImageUrl]];
     self.name.text = user.name;
     self.handle.text = user.screenName;
}

@end
