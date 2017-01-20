//
//  SpikeFighters.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "SpikeFighters.h"
#import "XMLDictionary.h"
#import "SpikeVideos.h"


@implementation WinBreadDown

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"WinningLossing: %@", dict);
    
    _tko        = [dict objectForKey:@"tko"];
    _submission = [dict objectForKey:@"submission"];
    _decision   = [dict objectForKey:@"decision"];
    
    return self;
}

- (int)getTko {
    if (_tko == nil)
        return 0;
    
    return _tko.intValue;
}

- (int)getSubmission {
    if (_submission == nil)
        return 0;
    
    return (int)_submission.intValue;
}

- (int)getDecision {
    if (_decision == nil)
        return 0;
    
    return (int)_decision.intValue;
}

@end


@implementation EventInfo : NSObject

- (instancetype)initData:(NSDictionary *)dict {
    
    NSLog(@"EventInfo: %@", dict);
    
    _name   = [dict objectForKey:@"name"];
    _date   = [dict objectForKey:@"date"];
    
    return self;
}

@end


@implementation OpponentInfo : NSObject

- (instancetype)initData:(NSDictionary *)dict {
    
    NSLog(@"OpponentInfo: %@", dict);
    
    _id             = [dict objectForKey:@"id"];
    _name           = [dict objectForKey:@"name"];
    _compustrikeId  = [dict objectForKey:@"compustrikeId"];
    __description   = [dict objectForKey:@"description"];
    _fightTitle     = [dict objectForKey:@"fightTitle"];
    _outcome        = [dict objectForKey:@"outcome"];
    
    NSDictionary *event = [dict objectForKey:@"event"];
    if (event) {
        _event = [[EventInfo alloc] initData:event];
    }
    
    return self;
}

@end


@implementation SeasonInfo

- (instancetype)initData:(NSDictionary *)dict {
    
    NSLog(@"SeasonInfo: %@", dict);
    
    _id     = [dict objectForKey:@"id"];
    _title  = [dict objectForKey:@"title"];
    
    NSDictionary *opponents = [dict objectForKey:@"opponents"];
    if (opponents != nil) {
        _opponents = [NSMutableArray new];
        
        NSMutableArray *fighters = [opponents objectForKey:@"fighter"];
        if ([fighters isKindOfClass:[NSDictionary class]]) {
            OpponentInfo *fighter = [[OpponentInfo alloc] initData:(NSDictionary *)fighters];
            [_opponents addObject:fighter];
        } else {
            for (int i = 0; i < fighters.count; i ++) {
                NSDictionary *dictFighter = fighters[i];
                
                OpponentInfo *fighter = [[OpponentInfo alloc] initData:dictFighter];
                [_opponents addObject:fighter];
            }
        }
        
    }
    
    return self;
}

@end


@implementation SpikeFighter


- (instancetype)initXmlData:(NSString *)xmlData {
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlData];
    //NSLog(@"dictionary: %@", xmlDoc);
    
    return [self initData:xmlDoc];
}


- (instancetype)initData:(NSDictionary *)dict {
    
    NSLog(@"SpikeFighter: %@", dict);
    
    _id             = [dict objectForKey:@"id"];
    _firstName      = [dict objectForKey:@"firstName"];
    _lastName       = [dict objectForKey:@"lastName"];
    _compustrikeId  = [dict objectForKey:@"compustrikeId"];
    _record         = [dict objectForKey:@"record"];
    _dob            = [dict objectForKey:@"dob"];
    _sex            = [dict objectForKey:@"sex"];
    _height         = [dict objectForKey:@"height"];
    _weight         = [dict objectForKey:@"weight"];
    _style          = [dict objectForKey:@"style"];
    _weightClass    = [dict objectForKey:@"weightClass"];
    _twitterHandle  = [dict objectForKey:@"twitterHandle"];
    _facebookId     = [dict objectForKey:@"facebookId"];
    _city           = [dict objectForKey:@"city"];
    _country        = [dict objectForKey:@"country"];
    _association    = [dict objectForKey:@"association"];
    
    NSDictionary    *winBreakdown = [dict objectForKey:@"winBreakdown"];
    if (winBreakdown != nil) {
        _winBreakdown = [[WinBreadDown alloc] initData:winBreakdown];
    }
    
    
    NSDictionary    *tournamentTimeline = [dict objectForKey:@"tournamentTimeline"];
    if (tournamentTimeline != nil) {
        _tournamentTimeline = [NSMutableArray new];
        
        NSMutableArray *seasons = [tournamentTimeline objectForKey:@"season"];
        if ([seasons isKindOfClass:[NSDictionary class]]) {
            SeasonInfo *season = [[SeasonInfo alloc] initData:(NSDictionary*)seasons];
            [_tournamentTimeline addObject:season];
        } else {
            for (int i = 0; i < seasons.count; i ++) {
                NSDictionary *dictSeason = [seasons objectAtIndex:i];
                
                SeasonInfo *season = [[SeasonInfo alloc] initData:dictSeason];
                [_tournamentTimeline addObject:season];
            }
        }
    }
    
    NSDictionary *videos = [dict objectForKey:@"videos"];
    if (videos != nil) {
        _videos = [[NSMutableArray alloc] init];
        
        NSMutableArray *arrVideos  = [videos valueForKey:@"item"];        
        for (int i = 0; i < arrVideos.count; i ++) {
            NSDictionary   *dictItem = [arrVideos objectAtIndex:i];
            
            SpikeVideo  *video = [[SpikeVideo alloc] initData:dictItem];
            [_videos addObject:video];
        }
    }
    
    
    return self;
}

- (int)getAge {
    if (_dob == nil)
        return -1;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSDate *birthDate = [dateFormatter dateFromString:_dob];
    if (birthDate == nil)
        return -1;
    
    NSDate *today = [NSDate date];
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:birthDate
                                       toDate:today
                                       options:0];
    if (ageComponents == nil)
        return -1;
    
    return (int)ageComponents.year;
}

- (NSString*)getAgeString {
    int age = [self getAge];
    if (age < 0)
        return @"N/A";
    
    return [NSString stringWithFormat:@"%d", age];
}

- (int)getTotalFightsCount {
    if (_record == nil)
        return 0;
    
    NSArray* foo = [_record componentsSeparatedByString: @"-"];
    if (foo == nil)
        return 0;
    
    int totalFightsCount = 0;
    for (int i = 0; i < foo.count; i++) {
        NSString* valueString = foo[i];
        if (valueString == nil)
            continue;
        
        totalFightsCount += [valueString intValue];
    }
    
    return totalFightsCount;
}

- (NSString*)getTotalFightsCountString {
    int totalFightsCount = [self getTotalFightsCount];
    return [NSString stringWithFormat:@"%d", totalFightsCount];
}

- (NSString*)getHeightString {
    NSString *heightString = [_height stringByReplacingOccurrencesOfString:@" " withString:@"'"];
    heightString = [heightString stringByAppendingString:@"\""];
    return heightString;
}

- (NSString*)getWeightString {
    NSString *weightString = [_weight stringByAppendingString:@"lbs"];
    return weightString;
}

- (int)getWinCount {
    if (_winBreakdown != nil) {
        int winCount = [_winBreakdown getTko] + [_winBreakdown getSubmission] + [_winBreakdown getDecision];
        if (winCount != 0)
            return winCount;
    }
    
    if (_record == nil)
        return 0;
    
    NSArray* foo = [_record componentsSeparatedByString: @"-"];
    if (foo == nil || foo.count == 0)
        return 0;
    
    NSString* valueString = foo[0];
    if (valueString == nil)
        return 0;
    
    return [valueString intValue];
}

- (NSString*)getWinCountString {
    int winCount = [self getWinCount];
    return [NSString stringWithFormat:@"%d", winCount];
}

- (NSString*)getTKOPercentString {
    int winCount = [self getWinCount];
    int percent = 0;
    if (winCount != 0) {
        percent = [_winBreakdown getTko] * 100 / winCount;
    }
    
    return [NSString stringWithFormat:@"%d (T)KOS - %d%%", [_winBreakdown getTko], percent];
}

- (NSString*)getTKOPercentString:(BOOL)forFullPercent {
    int winCount = [self getWinCount];
    int percent = 0;
    if (winCount != 0) {
        percent = MAX(0, 100 - [_winBreakdown getSubmission] * 100 / winCount - [_winBreakdown getDecision] * 100 / winCount);
    }
    
    return [NSString stringWithFormat:@"%d (T)KOS - %d%%", [_winBreakdown getTko], percent];
}

- (NSString*)getSubmissionPercentString {
    int winCount = [self getWinCount];
    int percent = 0;
    if (winCount != 0) {
        percent = [_winBreakdown getSubmission] * 100 / winCount;
    }
    
    return [NSString stringWithFormat:@"%d Submissions - %d%%", [_winBreakdown getSubmission], percent];
}

- (NSString*)getDecisionPercentString {
    int winCount = [self getWinCount];
    int percent = 0;
    if (winCount != 0) {
        percent = [_winBreakdown getDecision] * 100 / winCount;
    }
    
    return [NSString stringWithFormat:@"%d Decisions - %d%%", [_winBreakdown getDecision], percent];
}

- (int)getWinPercent {
    int winCount    = [self getWinCount];
    int totalCount  = [self getTotalFightsCount];
    if (totalCount == 0)
        return 0;
    return winCount * 100 / totalCount;
}

- (NSString*)getWinPercentString {
    int percent = [self getWinPercent];
    return [NSString stringWithFormat:@"%d%%", percent];
}

@end


@implementation SpikeFighters

- (instancetype)initXmlData:(NSString *)xmlData {
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlData];
    //NSLog(@"dictionary: %@", xmlDoc);
    
//    NSDictionary *dictChannel  = [xmlDoc valueForKey:@"channel"];
    _totalFightersCount = [xmlDoc valueForKey:@"_size"];
    
    NSMutableArray *arrFighters  = [xmlDoc valueForKey:@"fighter"];
    
    _arrayFighters = [[NSMutableArray alloc] init];
    for (int i = 0; i < arrFighters.count; i ++) {
        NSDictionary   *dictItem = [arrFighters objectAtIndex:i];
        
        SpikeFighter  *fighter = [[SpikeFighter alloc] initData:dictItem];
        [_arrayFighters addObject:fighter];
    }
    
    return self;
}



@end
