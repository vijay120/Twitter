//
//  HamburgerViewController.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/26/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HamburgerViewController : UIViewController
- (void) setTableViewInFocus: (UIViewController*) vc;
- (void) startControllerLifecycle: (UIViewController*) vc;
@end
