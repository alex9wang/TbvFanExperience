//
//  SpikePromoSchedule.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScheduleFight : NSObject

@property (nonatomic, strong) NSNumber* compustrikeId;
@property (nonatomic, strong) NSString* titleFight;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) NSString* fighter1Id;
@property (nonatomic, strong) NSString* fighter2Id;
@property (nonatomic, strong) NSString* _featured;

@end



@interface ScheduleEvent : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* compustrikeId;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) NSString* thumbnail;
@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, strong) NSString* time;
@property (nonatomic, strong) NSString* timestamp;
@property (nonatomic, strong) NSString* duration;
@property (nonatomic, strong) NSString* venue;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSString* buyTicketsUrl;
@property (nonatomic, strong) NSString* watchOn;
@property (nonatomic, strong) NSMutableArray* fights;   // ScheduleFight's array
@property (nonatomic, strong) NSString* callToAction;
@property (nonatomic, strong) NSString* callToActionUrl;

- (NSString*)getDescString;
- (NSString*)getTitleString;

@end


@interface SpikePromoSchedule : NSObject

@property (nonatomic, strong) NSMutableArray* arraySchedule;   // ScheduleEvent's array


- (instancetype)initXmlData:(NSString *)xmlData;


@end
