//
//  BellatorTally.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "BellatorTally.h"


@implementation TallyAnswer

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"TallyAnswer: %@", dict);
    
    _count      = [dict objectForKey:@"count"];
    _percentage = [dict objectForKey:@"percentage"];
    _value      = [dict objectForKey:@"value"];
    
    return self;
}
@end


@implementation TimeWindow

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"TimeWindow: %@", dict);
    
    _closing    = [dict objectForKey:@"closing"];
    _opening    = [dict objectForKey:@"opening"];
    _type       = [dict objectForKey:@"type"];
    
    return self;
}

@end


@implementation BellatorTally

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"BellatorTally: %@", dict);
    
    _answer = [[NSMutableArray alloc] init];
    NSMutableArray *arrAnswer = [dict objectForKey:@"answer"];
    for (int i = 0; i < arrAnswer.count; i ++) {
        NSDictionary *dictAnswer = [arrAnswer objectAtIndex:i];
        
        TallyAnswer *answer =  [[TallyAnswer alloc] initData:dictAnswer];
        [_answer addObject:answer];
    }
    
    _count      = [dict objectForKey:@"count"];
    _question   = [dict objectForKey:@"question"];
    
    NSDictionary *dictTimeWindow = [dict objectForKey:@"timeWindow"];
    _timeWindow =  [[TimeWindow alloc] initData:dictTimeWindow];
    
    return self;
}

@end


@implementation BellatorTallies

- (instancetype)initJsonData:(NSString *)jsonData {
    
    //NSLog(@"jsonData: %@", jsonData);
    
    NSDictionary *tallies = [jsonData valueForKey:@"tallies"];
    NSMutableArray *arrTallies = [tallies valueForKey:@"tally"];
    
    _arrayTallies = [[NSMutableArray alloc] init];
    for (int i = 0; i < arrTallies.count; i ++) {
        NSDictionary *dict = [arrTallies objectAtIndex:i];
        BellatorTally *tally = [[BellatorTally alloc] initData:dict];
        
        [_arrayTallies addObject:tally];
    }
    
    return self;
}



@end
