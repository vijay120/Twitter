//
//  TweetsViewController.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/19/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetsViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingSpace;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@end
