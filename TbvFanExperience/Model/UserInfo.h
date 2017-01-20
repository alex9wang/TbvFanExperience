//
//  UserInfo.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserInfo : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* user_id;
@property (nonatomic, strong) NSString* first_name;
@property (nonatomic, strong) NSString* last_name;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* picture;
@property (nonatomic, strong) NSString* facebook_id;
@property (nonatomic, strong) NSString* twitter_id;

- (instancetype)initJsonData:(id)jsonData;

@end
