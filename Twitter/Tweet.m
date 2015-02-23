//
//  Tweet.m
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/18/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (id) initWithDictionary:(NSDictionary *) dictionary {
    
    self = [super init];
    
    if (self) {
        NSLog(@"dictionary value is: %@", dictionary);
        self.text = dictionary[@"text"];
        self.user = [[User alloc] initWithDictionary: dictionary[@"user"]];
        NSString* createdAtString = dictionary[@"created_at"];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        
        self.createdAt = [formatter dateFromString:createdAtString];
        self.replyCount = dictionary[@"retweet_count"];
        self.favoritesCount = dictionary[@"favorite_count"];
        self.statusId = dictionary[@"id"];
        
        if (dictionary[@"retweeted_status"] != nil) {
            self.retweetPerson = dictionary[@"retweeted_status"][@"user"][@"name"];
        }
        
    };
    
    return self;
}

+ (NSArray *) tweetsWithArray: (NSArray *) array {
    NSMutableArray *tweets = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:dictionary]];
    }
    
    return tweets;
}


@end
