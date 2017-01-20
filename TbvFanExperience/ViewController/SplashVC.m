//
//  SplashVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "SplashVC.h"

#import "XMLDictionary.h"
#import "SpikeConfig.h"
#import "SpikeSponsership.h"
#import "SpikePromoSchedule.h"
#import "SpikeVideos.h"
#import "SpikeFighters.h"
#import "BellatorTally.h"
#import "VideoPlayerVC.h"

@interface SplashVC ()

@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([PREF boolForKey:PREF_IS_LOGIN]) {
        NSString *username = [PREF objectForKey:PREF_USERNAME];
        NSString *password = [PREF objectForKey:PREF_PASSWORD];
        
        NSMutableDictionary *dictParam=[[NSMutableDictionary alloc]init];
        [dictParam setValue:username forKey:@"username"];
        [dictParam setValue:password forKey:@"password"];
        
        [UTILITY showHub:YES];
        AFNHelper *afn=[[AFNHelper alloc]initWithRequestMethod:POST_METHOD];
        [afn requestHttp:SIGNIN_API withParam:dictParam withBlock:^(id response, NSError *error) {
            
            [UTILITY showHub:NO];
            if (!response) {
                [self performSegueWithIdentifier:@"SegueID_SplashToSigninVC" sender:nil];
                return;
            }
            
            if (![[response valueForKey:@"success"] boolValue]) {
                [self performSegueWithIdentifier:@"SegueID_SplashToSigninVC" sender:nil];
                return;
            }
            
            NSDictionary *dictData = [response valueForKey:@"data"];
            APPDELEGATE.userInfo = [[UserInfo alloc] initJsonData:dictData];
            
            [UTILITY gotoViewController:self vcId:@"SWRevealVC"];
        }];
    } else {
        [self performSegueWithIdentifier:@"SegueID_SplashToSigninVC" sender:nil];
    }
    
    
//    [UTILITY showHub:YES];
//    [BACKENDAPI loadVideosList:@1 success:^(id response) {
//        SpikeVideos *spikeVideos = response;
//        
//        for (int i = 0; i < 20; i ++) {
//            SpikeVideo *spikeVideo = [spikeVideos.arrayVideos objectAtIndex:i];
//            
////            NSString *width =spikeVideo.mediagroup.thumbnail.width;
////            NSString *height =spikeVideo.mediagroup.thumbnail.height;
////            
////            NSString *url = spikeVideo.mediagroup.thumbnail.url;
////            NSString *url1 = [spikeVideo.mediagroup.thumbnail getThumbnailUrl:256];
//            
////            NSLog(@"url: %@", url1);
//        }
////        [self dismissProgress];
//    } failure:^(NSError *error) {
//        [UTILITY showHub:NO];
//        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
//    }];
    
    
//    VideoPlayerVC *videoPlayerVC = (VideoPlayerVC*)[UtilityClass newViewControllerWithId:@"VideoPlayerVC" In:@"Main"];
//    videoPlayerVC.url = @"http://media.mtvnservices.com/mgid:arc:video:spike.com:35eb9cba-0dd7-4fb8-97db-56bd76a1cd0f";
//    [self.navigationController pushViewController:videoPlayerVC animated:YES];
    
    
//    [self testBackendAPI];
}


- (void)testBackendAPI {
    
//    NSString *fId = @"7cc86bb6-5f19-4ac2-9236-fef850ef0155";
    NSString *fId = @"64f8883e-0363-11e2-9c4c-a4badb23230a";
    
    [BACKENDAPI getFigherInfo:YES fighterId:fId success:^(id response) {
        
        response = response;
    } failure:^(NSError *error) {
        
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

- (void)loadConfig {
    
    [BACKENDAPI loadConfig:YES success:^(id config) {
        
        [APPDELEGATE setSpikeConfig:config];
    } failure:^(NSError *error) {
        
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

- (void)loadSponsership {
    
    [BACKENDAPI loadSponsership:YES success:^(id sponsership) {        
        
        NSLog(@"sponsered_home: %@", [sponsership sponsered_home]);
        NSLog(@"sponsered_video: %@", [sponsership sponsered_video]);
    } failure:^(NSError *error) {
        
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

- (void)loadTallies {
    
    [BACKENDAPI loadTallies:YES success:^(id tallies) {
        
        NSMutableArray *arrTallies = [tallies arrayTallies];
        for (int i = 0; i < arrTallies.count; i ++) {
            BellatorTally *tally = [arrTallies objectAtIndex:i];
            
            NSMutableArray *answer = [tally answer];
            
            TallyAnswer *leftAnswer = [answer objectAtIndex:0];
            TallyAnswer *rightAnswer = [answer objectAtIndex:1];
            
            NSLog(@"%@ - %@", [leftAnswer percentage], [rightAnswer percentage]);
            NSLog(@"%@ - %@", [leftAnswer value], [rightAnswer value]);
        }
        
    } failure:^(NSError *error) {
        
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

//
//- (void)call_loadPromoSchedule {
//    [BACKENDAPI loadPromoSchedule:YES success:^(id responseObject) {
//        
//        NSMutableArray *arraySchedule = responseObject;
//        for (int i = 0; i < arraySchedule.count; i ++) {
//            ScheduleFight *fight = [arraySchedule objectAtIndex:i];
//            
//            NSLog(@"title: %@", [fight _description]);
//            NSLog(@"%@ - %@", [fight fighter1Id], [fight fighter2Id]);
//            
////            SpikeFighter *fighter1 = [BACKENDAPI getFighterInfo:[fight fighter1Id]];
////            SpikeFighter *fighter2 = [BACKENDAPI getFighterInfo:[fight fighter2Id]];
//            
//            NSLog(@"image: %@", [BACKENDAPI getFighterPhotoUrl:[fight fighter2Id] imageType:@"left" width:@200]);
//            
//        }
//    } failure:^(NSError *error) {
//        
//        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
//    }];
//}
//
//- (void)call_loadFightersList {
//    [BACKENDAPI loadFightersList:YES success:^(id responseObject) {
//        
//        NSMutableArray *arraySchedule = responseObject;
//        for (int i = 0; i < arraySchedule.count; i ++) {
//        }
//        
//        [self call_loadPromoSchedule];
//        
//    } failure:^(NSError *error) {
//        
//        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
//    }];
//}




@end
