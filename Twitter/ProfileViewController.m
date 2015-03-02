//
//  ProfileViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 3/1/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"
#import "TweetTableViewCell.h"
#import "UserTableViewCell.h"

@interface ProfileViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *banner;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@property (weak, nonatomic) IBOutlet UILabel *following;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)segmentAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *followers;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *myTweets;
@property (nonatomic, strong) NSArray *myFollowers;
@property (nonatomic, strong) NSArray *myFriends;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    User* user = [User currentUser];
    [self.banner setImageWithURL:[NSURL URLWithString:user.bannerUrl]];
    [self.profileImage setImageWithURL:[NSURL URLWithString:user.profileImageUrl]];
    self.name.text = user.name;
    self.handle.text = user.screenName;
    self.followers.text = [NSString stringWithFormat:@"%@", user.followCount];
    self.following.text = [NSString stringWithFormat:@"%@", user.followingCount];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    self.navigationController.navigationBarHidden = YES;

    
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil] forCellReuseIdentifier:@"TweetTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil] forCellReuseIdentifier:@"UserTableViewCell"];
    
    //default
    NSDictionary *params = @{@"screen_name" : [User currentUser].screenName};
    [[TwitterClient sharedInstance] myTweetWithParams:params complete:^(NSArray *tweets, NSError *error) {
        if (error == nil) {
            self.myTweets = tweets;
            [self.tableView reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.segment.selectedSegmentIndex == 0) {
        return self.myTweets.count;
    } else if(self.segment.selectedSegmentIndex == 1) {
        return self.myFollowers.count;
    } else {
        return self.myFriends.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.segment.selectedSegmentIndex == 0) {
        TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell"];
        cell.tweet = self.myTweets[indexPath.row];
        return cell;
    } else if(self.segment.selectedSegmentIndex == 1) {
        UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell"];
        cell.user = self.myFriends[indexPath.row];
        return cell;
    } else {
        UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell"];
        cell.user = self.myFollowers[indexPath.row];
        return cell;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentAction:(id)sender {
    if(self.segment.selectedSegmentIndex == 0) {
        NSDictionary *params = @{@"screen_name" : [User currentUser].screenName};
        [[TwitterClient sharedInstance] myTweetWithParams:params complete:^(NSArray *tweets, NSError *error) {
            if (error == nil) {
                self.myTweets = tweets;
                [self.tableView reloadData];
            }
        }];
    } else if(self.segment.selectedSegmentIndex == 1) {
        NSDictionary *params = @{@"screen_name" : [User currentUser].screenName};
        [[TwitterClient sharedInstance] myFriendsWithParams:params complete:^(NSArray *users, NSError *error) {
            if (error == nil) {
                self.myFriends = users;
                [self.tableView reloadData];
            }
        }];
    } else {
        NSDictionary *params = @{@"screen_name" : [User currentUser].screenName};
        [[TwitterClient sharedInstance] myFollowersWithParams:params complete:^(NSArray *users, NSError *error) {
            if (error == nil) {
                self.myFollowers = users;
                [self.tableView reloadData];
            }
        }];
    }
}
@end
