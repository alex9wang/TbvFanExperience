//
//  UserInfo.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo

- (instancetype)initJsonData:(id)jsonData {
    
    //NSLog(@"jsonData: %@", jsonData);
    
    _id             = [jsonData objectForKey:@"id"];
    _user_id        = [jsonData objectForKey:@"user_id"];
    _first_name     = [jsonData objectForKey:@"first_name"];
    _last_name      = [jsonData objectForKey:@"last_name"];
    _username       = [jsonData objectForKey:@"username"];
    _email          = [jsonData objectForKey:@"email"];
    _picture        = [jsonData objectForKey:@"picture"];
    _facebook_id    = [jsonData objectForKey:@"facebook_id"];
    _twitter_id     = [jsonData objectForKey:@"twitter_id"];
    
    return self;
}



@end
