//
//  MenuViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/24/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "TwitterClient.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "ProfileViewController.h"
#import "HamburgerViewController.h"
#import "ProfileViewController.h"
#import "TweetsViewController.h"
#import "MentionsViewController.h"

@interface MenuViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *profileDetailsView;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UINavigationController* nav;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nav didMoveToParentViewController:self];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell"];
    
    if (indexPath.row == 0) {
        [cell.button setTitle:@"Profile" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(profileButtonClicked:) forControlEvents:UIControlEventTouchDown];
    } else if (indexPath.row == 1) {
        [cell.button setTitle:@"Timeline" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(timelineButtonClicked:) forControlEvents:UIControlEventTouchDown];
    } else if (indexPath.row == 2) {
        [cell.button setTitle:@"Mentions" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(mentionsButtonClicked:) forControlEvents:UIControlEventTouchDown];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"My title";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    [self.profilePic setImageWithURL:[NSURL URLWithString:[User currentUser].profileImageUrl]];
    self.name.text = [User currentUser].name;
    self.handle.text = [@"@" stringByAppendingString:[User currentUser].screenName];
    return self.profileDetailsView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}

-(void) profileButtonClicked:(UIButton*)sender
{
    ProfileViewController* profileViewController = [[ProfileViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    HamburgerViewController* parentVc = (HamburgerViewController*)[self parentViewController];
    [parentVc startControllerLifecycle:profileViewController];
    [parentVc setTableViewInFocus:profileViewController];
    [parentVc setTableViewInFocus:self.nav];
}

-(void) timelineButtonClicked:(UIButton*)sender
{
    HamburgerViewController* parentVc = (HamburgerViewController*)[self parentViewController];
    [parentVc viewDidLoad];
}

-(void) mentionsButtonClicked:(UIButton*)sender
{
    MentionsViewController* profileViewController = [[MentionsViewController alloc] init];
    HamburgerViewController* parentVc = (HamburgerViewController*)[self parentViewController];
    [parentVc startControllerLifecycle:profileViewController];
    [parentVc setTableViewInFocus:profileViewController];
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
