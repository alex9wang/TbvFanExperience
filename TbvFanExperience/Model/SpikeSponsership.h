//
//  SpikeSponsership.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpikeSponsership : NSObject

@property (nonatomic, strong) NSString* sponsered_home;
@property (nonatomic, strong) NSString* sponsered_fighters;
@property (nonatomic, strong) NSString* sponsered_tournament;
@property (nonatomic, strong) NSString* sponsered_video;
@property (nonatomic, strong) NSString* sponsered_schedule;
@property (nonatomic, strong) NSString* sponsered_tickets;

- (instancetype)initJsonData:(NSString *)jsonData;


@end
