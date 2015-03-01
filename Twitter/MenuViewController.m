//
//  MenuViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/24/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"

@interface MenuViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I got triggered in the menu controller");
    // Do any additional setup after loading the view from its nib.
    
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
        [cell.button setTitle:@"Your Profile" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(profileButtonClicked:) forControlEvents:UIControlEventTouchDown];
    } else if (indexPath.row == 1) {
        [cell.button setTitle:@"Home Timeline" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(timelineButtonClicked:) forControlEvents:UIControlEventTouchDown];
    } else if (indexPath.row == 2) {
        [cell.button setTitle:@"Your Mentions" forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(mentionsButtonClicked:) forControlEvents:UIControlEventTouchDown];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"My title";
}


-(void) profileButtonClicked:(UIButton*)sender
{
    NSLog(@"you clicked on button");
}

-(void) timelineButtonClicked:(UIButton*)sender
{
    NSLog(@"you clicked on button");
    
}

-(void) mentionsButtonClicked:(UIButton*)sender
{
    NSLog(@"you clicked on button");
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
