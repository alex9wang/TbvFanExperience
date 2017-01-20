//
//  ScheduleFightVC.h
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpikePromoSchedule.h"
#import "HomeVC.h"
#import "CircleProgressBar.h"

@interface ScheduleFightVC : BaseVC

@property (weak, nonatomic) IBOutlet UIImageView        *imgFighter1;
@property (weak, nonatomic) IBOutlet UIImageView        *imgFighter2;

@property (weak, nonatomic) IBOutlet UIView             *percentPane;
@property (weak, nonatomic) IBOutlet CircleProgressBar  *pbFighter1;
@property (weak, nonatomic) IBOutlet UIButton           *btnVote1;
@property (weak, nonatomic) IBOutlet CircleProgressBar  *pbFighter2;
@property (weak, nonatomic) IBOutlet UIButton           *btnVote2;

@property (weak, nonatomic) IBOutlet UIView             *simplePane;
@property (weak, nonatomic) IBOutlet UIView             *detailPane;
@property (weak, nonatomic) IBOutlet UILabel            *lblDesc;
@property (weak, nonatomic) IBOutlet UILabel            *lblVSWithNames;
@property (weak, nonatomic) IBOutlet UILabel            *lblFighter1FirstName;
@property (weak, nonatomic) IBOutlet UILabel            *lblFighter1LastName;
@property (weak, nonatomic) IBOutlet UILabel            *lblFighter2FirstName;
@property (weak, nonatomic) IBOutlet UILabel            *lblFighter2LastName;

@property (strong, nonatomic) HomeVC                    *homeVC;
@property int                                           pageIndex;

@property (strong, nonatomic) ScheduleFight             *scheduleFight;
@property int                                           eventIndex;

- (void)refreshUI;

@end

