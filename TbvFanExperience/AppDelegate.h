//
//  AppDelegate.h
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpikeConfig.h"

@class SWRevealViewController;

#define APPDELEGATE     ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SWRevealViewController *viewController;

@property (nonatomic, strong) SpikeConfig *spikeConfig;
@property (nonatomic, strong) UserInfo  *userInfo;

+(AppDelegate *)sharedAppDelegate;
- (BOOL)connected;

@end

