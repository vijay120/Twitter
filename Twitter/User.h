//
//  User.h
//  Twitter
//
//  Created by Vijay Ramakrishnan on 2/18/15.
//  Copyright (c) 2015 Vijay Ramakrishnan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const UserDidLoginNotification;
extern NSString * const UserDidLogoutNotification;

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *tagLine;
@property (nonatomic, strong) NSString *bannerUrl;
@property (nonatomic, assign) NSString *followCount;
@property (nonatomic, strong) NSString *followingCount;

- (id) initWithDictionary:(NSDictionary *) dictionary;

+(User *)currentUser;
+(void)setCurrentUser:(User *)currentUser;
+(void)logout;
+ (NSArray *) usersWithArray: (NSArray *) array;
@end
