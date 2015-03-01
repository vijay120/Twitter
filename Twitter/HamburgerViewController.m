//
//  HamburgerViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/26/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "HamburgerViewController.h"
#import "MenuViewController.h"
#import "TweetsViewController.h"

@interface HamburgerViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) MenuViewController *mc;
@property (nonatomic, strong) TweetsViewController *tc;
@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)onPanGesture:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, assign) CGRect startMenuLocation;
@property (nonatomic, assign) CGPoint tableCenter;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (nonatomic, assign) CGPoint translationXPoint;
@property (nonatomic, assign) CGPoint tcCenterRight;
@property (nonatomic, assign) CGPoint tcCenterLeft;
@property (nonatomic, assign) CGRect tcRight;
@property (nonatomic, strong) UINavigationController* nav;
@end

@implementation HamburgerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mc = [[MenuViewController alloc] init];
    self.tc = [[TweetsViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:self.tc];
    
    [self addChildViewController:self.nav];
    self.nav.view.frame = self.containerView.frame;
    [self.containerView addSubview:self.nav.view];
    [self.nav didMoveToParentViewController:self];
    
    [self addChildViewController:self.mc];
    self.mc.view.frame = self.containerView.frame;
    [self.containerView addSubview:self.mc.view];
    [self.mc didMoveToParentViewController:self];
    
    [self addChildViewController:self.tc];
    self.tc.view.frame = self.containerView.frame;
    [self.containerView addSubview:self.tc.view];
    [self.tc didMoveToParentViewController:self];
    
    self.tc.panGesture.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onPanGesture:(UIPanGestureRecognizer*)sender {
//    //this is to the view and not the container view??
    CGPoint point = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.tableCenter = self.tc.view.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        //self.tc.leadingSpace.constant = self.tableCenter.x + point.x;
        self.tc.view.center = CGPointMake(self.tableCenter.x + point.x, self.tableCenter.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:0 animations:^{
            if (velocity.x > 0) {
                self.tc.view.center = CGPointMake(self.containerView.center.x + 120, self.containerView.center.y);
            } else {
                self.tc.view.frame = self.containerView.frame;
            }
        } completion:^(BOOL finished) {
            //dun nothing
        }];
    }
    NSLog(@"on pan");
}
@end
