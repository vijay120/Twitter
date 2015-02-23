//
//  TwitterClient.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/17/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager
+ (TwitterClient *) sharedInstance;
- (void)loginWithCompletion:(void (^)(User *user, NSError *error)) completion;
- (void) openUrl: (NSURL *) url;
- (void) homeTimelineWithParams: (NSDictionary *)params complete:(void (^)(NSArray *tweets, NSError *error)) completion;
- (void) postStatus: (NSDictionary *)params complete:(void (^)(NSError *error)) completion;
- (void) postFavorite: (NSDictionary *)params complete:(void (^)(NSError *error)) completion;
- (void) postRetweet: (NSDictionary *)params complete:(void (^)(NSError *error)) completion;

@end
