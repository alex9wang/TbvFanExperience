//
//  SpikeConfig.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpikeConfig : NSObject

@property (nonatomic, strong) NSString* scheduleFeed;
@property (nonatomic, strong) NSString* liveEventFeed;
@property (nonatomic, strong) NSString* allVideosFeed;
@property (nonatomic, strong) NSString* filterTags;
@property (nonatomic, strong) NSString* fightersFeed;
@property (nonatomic, strong) NSString* fightersFeedPaged;
@property (nonatomic, strong) NSString* fighterStatsFeed;
@property (nonatomic, strong) NSString* fighterBellatorFeed;
@property (nonatomic, strong) NSString* fighterLandingFeed;
@property (nonatomic, strong) NSString* featuredTilesFeed;
@property (nonatomic, strong) NSString* seasonsFeed;
@property (nonatomic, strong) NSString* seasonDetailsFeed;
@property (nonatomic, strong) NSString* termsAndConditionsFeed;
@property (nonatomic, strong) NSString* offSeasonDefaultTab;
@property (nonatomic, strong) NSString* fourthJudgeDecisionPoint;
@property (nonatomic, strong) NSString* tweetsFeed;
@property (nonatomic, strong) NSString* offSeasonURL;
@property (nonatomic, strong) NSString* sponsorshipFeed;
@property (nonatomic, strong) NSString* twitterAPI;
@property (nonatomic, strong) NSString* fighterImagesBaseUrl;
@property (nonatomic, strong) NSString* liveStatsUpdateInterval;
@property (nonatomic, strong) NSString* self_mGid;
@property (nonatomic, strong) NSString* funnelPostUrlBase;
@property (nonatomic, strong) NSString* androidVideosFeed;
@property (nonatomic, strong) NSString* bellatorFighterImagesBaseUrl;
@property (nonatomic, strong) NSString* scheduleFeedV2;
@property (nonatomic, strong) NSString* tournamentDetailFeed;
@property (nonatomic, strong) NSString* ticketsLink;


- (instancetype)initXmlData:(NSString *)xmlData;


@end
