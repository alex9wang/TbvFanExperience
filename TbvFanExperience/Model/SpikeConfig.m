//
//  SpikeConfig.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "SpikeConfig.h"
#import "XMLDictionary.h"

@interface SpikeConfig () {
    
}

@end


@implementation SpikeConfig

- (instancetype)initXmlData:(NSString *)xmlData {
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlData];
    //NSLog(@"dictionary: %@", xmlDoc);
    
    NSMutableArray *dict        = [xmlDoc valueForKey:@"dict"];
    NSMutableArray *arrKeys     = [dict valueForKey:@"key"];
    NSMutableArray *arrValues   = [dict valueForKey:@"string"];
    
    NSMutableDictionary  *configParams = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < arrKeys.count; i ++) {
        [configParams setObject:[arrValues objectAtIndex:i] forKey:[arrKeys objectAtIndex:i]];
        //NSLog(@"%@:    %@", [arrKeys objectAtIndex:i], [arrValues objectAtIndex:i]);
    }
    
    _scheduleFeed           = [configParams objectForKey:@"scheduleFeed"];
    _liveEventFeed          = [configParams objectForKey:@"liveEventFeed"];
    _allVideosFeed          = [configParams objectForKey:@"allVideosFeed"];
    _filterTags             = [configParams objectForKey:@"filterTags"];
    _fightersFeed           = [configParams objectForKey:@"fightersFeed"];
    _fightersFeedPaged      = [configParams objectForKey:@"fightersFeedPaged"];
    _fighterStatsFeed       = [configParams objectForKey:@"fighterStatsFeed"];
    _fighterBellatorFeed	= [configParams objectForKey:@"fighterBellatorFeed"];
    _fighterLandingFeed     = [configParams objectForKey:@"fighterLandingFeed"];
    _featuredTilesFeed      = [configParams objectForKey:@"featuredTilesFeed"];
    _seasonsFeed            = [configParams objectForKey:@"seasonsFeed"];
    _seasonDetailsFeed      = [configParams objectForKey:@"seasonDetailsFeed"];
    _termsAndConditionsFeed	= [configParams objectForKey:@"termsAndConditionsFeed"];
    _offSeasonDefaultTab	= [configParams objectForKey:@"offSeasonDefaultTab"];
    _fourthJudgeDecisionPoint	= [configParams objectForKey:@"fourthJudgeDecisionPoint"];
    _tweetsFeed             = [configParams objectForKey:@"tweetsFeed"];
    _offSeasonURL           = [configParams objectForKey:@"offSeasonURL"];
    _sponsorshipFeed        = [configParams objectForKey:@"sponsorshipFeed"];
    _twitterAPI             = [configParams objectForKey:@"twitterAPI"];
    _fighterImagesBaseUrl	= [configParams objectForKey:@"fighterImagesBaseUrl"];
    _liveStatsUpdateInterval = [configParams objectForKey:@"liveStatsUpdateInterval"];
    _self_mGid              = [configParams objectForKey:@"self.mGid"];
    _funnelPostUrlBase      = [configParams objectForKey:@"funnelPostUrlBase"];
    _androidVideosFeed      = [configParams objectForKey:@"androidVideosFeed"];
    _bellatorFighterImagesBaseUrl = [configParams objectForKey:@"bellatorFighterImagesBaseUrl"];
    _scheduleFeedV2         = [configParams objectForKey:@"scheduleFeedV2"];
    _tournamentDetailFeed	= [configParams objectForKey:@"tournamentDetailFeed"];
    _ticketsLink            = [configParams objectForKey:@"ticketsLink"];
    
    return self;
}



@end
