//
//  ScheduleFightVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "ScheduleFightVC.h"
#import "UIImageView+WebCache.h"

@interface ScheduleFightVC ()
{
    SpikeFighter    *fighter1;
    SpikeFighter    *fighter2;
}
@end

@implementation ScheduleFightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fighter1PhotoUrl = [BACKENDAPI getFighterPhotoUrl:_scheduleFight.fighter1Id imageType:@"left" width:@(200)];
    NSString *fighter2PhotoUrl = [BACKENDAPI getFighterPhotoUrl:_scheduleFight.fighter2Id imageType:@"right" width:@(200)];
    [_imgFighter1 sd_setImageWithURL:[[NSURL alloc] initWithString:fighter1PhotoUrl] placeholderImage:[UIImage imageNamed:@"player_left_mark.png"]];
    [_imgFighter2 sd_setImageWithURL:[[NSURL alloc] initWithString:fighter2PhotoUrl] placeholderImage:[UIImage imageNamed:@"player_right_mark.png"]];
    
    _lblDesc.text         = _scheduleFight._description;
    
    fighter1 = [BACKENDAPI getFighterInfo:_scheduleFight.fighter1Id];
    fighter2 = [BACKENDAPI getFighterInfo:_scheduleFight.fighter2Id];
    
    _lblFighter1FirstName.text  = [UTILITY getString:fighter1.firstName placeholder:kStringUnknown];
    _lblFighter1LastName.text   = [UTILITY getString:fighter1.lastName placeholder:kStringUnknown];
    _lblFighter2FirstName.text  = [UTILITY getString:fighter2.firstName placeholder:kStringUnknown];
    _lblFighter2LastName.text   = [UTILITY getString:fighter2.lastName placeholder:kStringUnknown];
    
    _lblVSWithNames.text        = [NSString stringWithFormat:@"%@ vs %@", fighter1.lastName, fighter2.lastName];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshUI];
}

- (IBAction)onVotingModeButtonClicked:(id)sender {
    if (!_homeVC.voteMode) {
        _homeVC.voteMode = YES;
        [_homeVC refreshUI];
        [self refreshUI];
        return;
    }
    
}

- (void)refreshUI {
    _simplePane.hidden  = _homeVC.voteMode;
    _detailPane.hidden  = !_homeVC.voteMode;
    _pbFighter1.hidden  = !_homeVC.voteMode;
    _pbFighter2.hidden  = !_homeVC.voteMode;
    
    if (_homeVC.voteMode) {
        [_pbFighter1 setProgress:0.f animated:NO];
        [_pbFighter2 setProgress:0.f animated:NO];
        
        [_pbFighter1 setProgress:[fighter1 getWinPercent] / 100.0 animated:YES];
        [_pbFighter2 setProgress:[fighter2 getWinPercent] / 100.0 animated:YES];
    }
}

@end
