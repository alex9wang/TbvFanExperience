//
//  SpikePromoSchedule.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "SpikePromoSchedule.h"
#import "XMLDictionary.h"


@implementation ScheduleFight

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"ScheduleFight: %@", dict);
    
    _compustrikeId  = [dict objectForKey:@"compustrikeId"];
    _titleFight     = [dict objectForKey:@"titleFight"];
    __description   = [dict objectForKey:@"description"];
    _fighter1Id     = [dict objectForKey:@"fighter1Id"];
    _fighter2Id     = [dict objectForKey:@"fighter2Id"];
    __featured      = [dict objectForKey:@"_featured"];
    
    return self;
}

@end

@implementation ScheduleEvent

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"ScheduleEvent: %@", dict);
    
    _id                 = [dict objectForKey:@"id"];
    _compustrikeId      = [dict objectForKey:@"compustrikeId"];
    _title              = [dict objectForKey:@"title"];
    __description       = [dict objectForKey:@"description"];
    _thumbnail          = [dict objectForKey:@"thumbnail"];
    _type               = [dict objectForKey:@"type"];
    _date               = [dict objectForKey:@"date"];
    _time               = [dict objectForKey:@"time"];
    _timestamp          = [dict objectForKey:@"timestamp"];
    _duration           = [dict objectForKey:@"duration"];
    _venue              = [dict objectForKey:@"venue"];
    _city               = [dict objectForKey:@"city"];
    _state              = [dict objectForKey:@"state"];
    _buyTicketsUrl      = [dict objectForKey:@"buyTicketsUrl"];
    _watchOn            = [dict objectForKey:@"watchOn"];
    
    NSDictionary *fights = [dict objectForKey:@"fights"];
    if (fights != nil) {
        NSMutableArray *newArrFights = [[NSMutableArray alloc] init];
        
        NSMutableArray *arrFights = [fights objectForKey:@"fight"];
        
        if ([arrFights isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictFight = (NSDictionary*)arrFights;
            
            ScheduleFight   *fight = [[ScheduleFight alloc] initData:dictFight];
            [newArrFights addObject:fight];
        } else {
            for (int j = 0; j < arrFights.count; j ++) {
                NSDictionary *dictFight = [arrFights objectAtIndex:j];
                
                ScheduleFight   *fight = [[ScheduleFight alloc] initData:dictFight];
                [newArrFights addObject:fight];
            }
        }
        
        _fights = newArrFights;
    }
    
    _callToAction       = [dict objectForKey:@"callToAction"];
    _callToActionUrl    = [dict objectForKey:@"callToActionUrl"];
    
    return self;
}

- (NSString*)getTitleString {
    if (_title == nil)
        return @"";
    
    return [_title uppercaseString];
}

- (NSString*)getDescString {
    if (_time == nil && _watchOn == nil)
        return @"";
    
    NSString* desc = @"";
    if (_time != nil && ![_time isEqualToString:@""])
        desc = [NSString stringWithFormat:@"%@ AT %@", desc, _time];
    if (_watchOn != nil && ![_watchOn isEqualToString:@""])
        desc = [NSString stringWithFormat:@"%@ ON %@", desc, _watchOn];
    
    if ([desc isEqualToString:@""])
        return @"";
    
    desc = [desc uppercaseString];
    return [NSString stringWithFormat:@"LIVE TELEVISED BOUTS START%@", desc];
}

@end


@implementation SpikePromoSchedule

- (instancetype)initXmlData:(NSString *)xmlData {
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlData];
    //NSLog(@"dictionary: %@", xmlDoc);
    
    NSMutableArray *arrEvents        = [xmlDoc valueForKey:@"event"];
    
    _arraySchedule = [[NSMutableArray alloc] init];
    for (int i = 0; i < arrEvents.count; i ++) {
        NSDictionary *dictEvent = [arrEvents objectAtIndex:i];
        
        ScheduleEvent *scheduleEvent = [[ScheduleEvent alloc] initData:dictEvent];
        
        [_arraySchedule addObject:scheduleEvent];
    }
    
    return self;
}

@end





