//
//  SpikeVideos.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WinBreadDown : NSObject

@property (nonatomic, strong) NSNumber* tko;
@property (nonatomic, strong) NSNumber* submission;
@property (nonatomic, strong) NSNumber* decision;

- (int)getTko;
- (int)getSubmission;
- (int)getDecision;

@end


@interface EventInfo : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* date;

@end


@interface OpponentInfo : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* compustrikeId;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) NSString* fightTitle;
@property (nonatomic, strong) NSString* outcome;
@property (nonatomic, strong) EventInfo* event;

@end

@interface SeasonInfo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSMutableArray* opponents;    // OpponentInfo's array

@end


@interface SpikeFighter : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* compustrikeId;
@property (nonatomic, strong) NSString* record;
@property (nonatomic, strong) NSString* dob;
@property (nonatomic, strong) NSString* sex;
@property (nonatomic, strong) NSString* height;
@property (nonatomic, strong) NSString* weight;
@property (nonatomic, strong) NSString* style;
@property (nonatomic, strong) NSString* weightClass;
@property (nonatomic, strong) NSString* facebookId;
@property (nonatomic, strong) NSString* twitterHandle;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* country;
@property (nonatomic, strong) NSString* association;
@property (nonatomic, strong) WinBreadDown* winBreakdown;
@property (nonatomic, strong) NSMutableArray* tournamentTimeline;
@property (nonatomic, strong) NSMutableArray* videos;  // SpikeVideo's array

- (instancetype)initXmlData:(NSString *)xmlData;

- (int)getTotalFightsCount;
- (int)getAge;
- (NSString*)getAgeString;
- (NSString*)getTotalFightsCountString;
- (NSString*)getHeightString;
- (NSString*)getWeightString;
- (int)getWinCount;
- (NSString*)getWinCountString;
- (NSString*)getTKOPercentString;
- (NSString*)getTKOPercentString:(BOOL)forFullPercent;
- (NSString*)getSubmissionPercentString;
- (NSString*)getDecisionPercentString;
- (int)getWinPercent;
- (NSString*)getWinPercentString;

@end


@interface SpikeFighters : NSObject

@property (nonatomic, strong) NSMutableArray* arrayFighters;    // SpikeFighter's array
@property (nonatomic, strong) NSNumber* totalFightersCount;


- (instancetype)initXmlData:(NSString *)xmlData;


@end
