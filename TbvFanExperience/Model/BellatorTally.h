//
//  BellatorTally.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TallyAnswer : NSObject

@property (nonatomic, strong) NSNumber* count;
@property (nonatomic, strong) NSNumber* percentage;
@property (nonatomic, strong) NSString* value;

@end


@interface TimeWindow : NSObject

@property (nonatomic, strong) NSNumber* closing;
@property (nonatomic, strong) NSNumber* opening;
@property (nonatomic, strong) NSString* type;

@end


@interface BellatorTally : NSObject

@property (nonatomic, strong) NSMutableArray* answer;
@property (nonatomic, strong) NSString* count;
@property (nonatomic, strong) NSString* question;
@property (nonatomic, strong) TimeWindow* timeWindow;

@end


@interface BellatorTallies : NSObject

@property (nonatomic, strong) NSMutableArray* arrayTallies;    // BellatorTally's array

- (instancetype)initJsonData:(NSString *)jsonData;


@end
