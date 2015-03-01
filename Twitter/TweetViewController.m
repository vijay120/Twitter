//
//  TweetViewController.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/22/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "TweetViewController.h"
#import "TweetsViewController.h"
#import "TwitterClient.h"
#import "UIImageView+AFNetworking.h"

@interface TweetViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@property (strong, nonatomic) NSString *handleText;
@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textView.delegate = self;
    
    NSLog(@"In the tweets controller");
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel)];
    self.tweetButton = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(noOp)];
    self.navigationItem.rightBarButtonItem = self.tweetButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:self.user.profileImageUrl]];
    self.name.text = self.user.name;
    self.handle.text = self.user.screenName;
    
    if (self.handleText != nil) {
        [self.textView setText:self.handleText];
        [self.textView setTextColor:[UIColor blackColor]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCancel {
    TweetsViewController *vc = [[TweetsViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)onTweet {
    NSDictionary *params = @{@"status" : self.textView.text};
    [[TwitterClient sharedInstance] postStatus:params complete:^(NSError *error) {
        if (error == nil){
            [self onCancel];
        }
    }];
}

- (void) setHandleFromSomewhere: (NSString *) handle
{
    self.handleText = [[@"@" stringByAppendingString:handle] stringByAppendingString:@" "];
}

- (void)noOp {
    //do nothing
}

#pragma mark - Text view handling

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"What's happening?"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    
    [textView becomeFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView {
    
    if ([textView.text length] > 0) {
        self.tweetButton.action = @selector(onTweet);
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:34.0/255.0 green:97.0/255.0 blue:221.0/255.0 alpha:1];
    } else {
        self.tweetButton.action = @selector(noOp);
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"What's happening?";
        textView.textColor = [UIColor grayColor]; //optional
    }
    [textView resignFirstResponder];
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
