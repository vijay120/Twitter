//
//  ShowTweetViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "ShowTweetViewController.h"
#import "TweetsViewController.h"
#import "TweetViewController.h"
#import "User.h"
#import "StatusTableViewCell.h"
#import "ActionTableViewCell.h"
#import "StatsTableViewCell.h"

@interface ShowTweetViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ShowTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tweet";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(onHome)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reply" style:UIBarButtonItemStylePlain target:self action:@selector(onReply)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"StatusTableViewCell" bundle:nil] forCellReuseIdentifier:@"StatusTableViewCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ActionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ActionTableViewCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"StatsTableViewCell" bundle:nil] forCellReuseIdentifier:@"StatsTableViewCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onHome {
    TweetsViewController *vc = [[TweetsViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)onReply {
    TweetViewController *vc = [[TweetViewController alloc] init];
    vc.user = [User currentUser];
    [vc setHandleFromSomewhere:[User currentUser].screenName];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        StatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatusTableViewCell"];
        cell.tweet = self.tweet;
        return cell;
    } else if (indexPath.row == 1) {
        StatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatsTableViewCell"];
        cell.tweet = self.tweet;
        return cell;
    } else if (indexPath.row == 2) {
        ActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionTableViewCell"];
        cell.tweet = self.tweet;
        return cell;
    } else {
        StatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatusTableViewCell"];
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

@end
