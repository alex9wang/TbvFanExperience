//
//  SpikeSponsership.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "SpikeSponsership.h"
#import "XMLDictionary.h"

@interface SpikeSponsership () {
    
}

@end


@implementation SpikeSponsership

- (instancetype)initJsonData:(NSString *)jsonData {
    
    NSMutableArray *arrSections = [jsonData valueForKey:@"sections"];
    
    NSMutableDictionary  *sponserParams = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < arrSections.count; i ++) {
        NSDictionary *section = [arrSections objectAtIndex:i];
        
        NSString *name = [section objectForKey:@"name"];
        NSString *sponsored = [section objectForKey:@"sponsored"];
        
        [sponserParams setObject:sponsored forKey:name];
    }
    
    _sponsered_home         = [sponserParams objectForKey:@"home"];
    _sponsered_fighters     = [sponserParams objectForKey:@"fighters"];
    _sponsered_tournament   = [sponserParams objectForKey:@"tournament"];
    _sponsered_video        = [sponserParams objectForKey:@"video"];
    _sponsered_schedule     = [sponserParams objectForKey:@"schedule"];
    _sponsered_tickets      = [sponserParams objectForKey:@"tickets"];    
    
    return self;
}



@end
