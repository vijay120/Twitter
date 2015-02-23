//
//  Tweet.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/18/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (strong, nonatomic) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *replyCount;
@property (nonatomic, strong) NSString *favoritesCount;
@property (nonatomic, strong) NSString *retweetPerson;
@property (nonatomic, strong) NSString *statusId;

- (id) initWithDictionary:(NSDictionary *) dictionary;
+ (NSArray *) tweetsWithArray: (NSArray *) array;

@end
