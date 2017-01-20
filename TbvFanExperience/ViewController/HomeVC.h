//
//  HomeVC.h
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpikePromoSchedule.h"
#import "SpikeVideos.h"

@interface HomeVC : BaseVC <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblDefaultTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblEventTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblEventDesc;

@property (weak, nonatomic) IBOutlet UIView             *fightTitlePane;
@property (weak, nonatomic) IBOutlet UILabel            *lblFightTitle;

@property (weak, nonatomic) IBOutlet UIView             *bottomPane;

@property (weak, nonatomic) IBOutlet UIView             *spikeVideosPane;
@property (weak, nonatomic) IBOutlet UICollectionView   *videoCollectionView;

@property (weak, nonatomic) IBOutlet UIView             *detailPane;

@property (weak, nonatomic) IBOutlet UIImageView        *imgFightCardTab;
@property (weak, nonatomic) IBOutlet UIImageView        *imgFighterInfoTab;
@property (weak, nonatomic) IBOutlet UIImageView        *imgFighterVideosTab;

@property (weak, nonatomic) IBOutlet UIView             *fightCardPane;
@property (weak, nonatomic) IBOutlet UILabel            *lblRecord1;
@property (weak, nonatomic) IBOutlet UILabel            *lblTotalFights1;
@property (weak, nonatomic) IBOutlet UILabel            *lblAge1;
@property (weak, nonatomic) IBOutlet UILabel            *lblHeight1;
@property (weak, nonatomic) IBOutlet UILabel            *lblWeight1;
@property (weak, nonatomic) IBOutlet UILabel            *lblRecord2;
@property (weak, nonatomic) IBOutlet UILabel            *lblTotalFights2;
@property (weak, nonatomic) IBOutlet UILabel            *lblAge2;
@property (weak, nonatomic) IBOutlet UILabel            *lblHeight2;
@property (weak, nonatomic) IBOutlet UILabel            *lblWeight2;

@property (weak, nonatomic) IBOutlet UIView             *fighterInfoPane;
@property (weak, nonatomic) IBOutlet UILabel            *lblTKOPercent1;
@property (weak, nonatomic) IBOutlet UILabel            *lblSubmissionPercent1;
@property (weak, nonatomic) IBOutlet UILabel            *lblDecisionPercent1;
@property (weak, nonatomic) IBOutlet UILabel            *lblTKOPercent2;
@property (weak, nonatomic) IBOutlet UILabel            *lblSubmissionPercent2;
@property (weak, nonatomic) IBOutlet UILabel            *lblDecisionPercent2;

@property (weak, nonatomic) IBOutlet UIView             *fighterVideosPane;

@property (strong, nonatomic) UIPageViewController      *scheduleFightPageVC;
@property (strong, nonatomic) NSMutableArray            *arrScheduleFightVCControllers;

@property (strong, nonatomic) SpikePromoSchedule        *promoScheduleData;
@property (strong, nonatomic) SpikeVideos               *spikeVideos;

@property BOOL                                          voteMode;

- (void)refreshUI;

@end

