//
//  HomeVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "HomeVC.h"
#import "ScheduleFightVC.h"
#import "VideoPlayerVC.h"
#import "UIImageView+WebCache.h"

@interface HomeVC ()
{
    int     busyCount;
    int     tabIndex;
}
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tabIndex = 0;
    _voteMode = NO;
    
    _lblEventTitle.hidden   = YES;
    _lblEventDesc.hidden    = YES;
    _fightTitlePane.hidden  = YES;
    _bottomPane.hidden      = YES;
    
    [self setSliderMenuButton];
    
    busyCount = 3;
    [UTILITY showHub:YES];
    
    [self getFightersArray];
    [self getSpikePromoSchedule];
    [self getSpikeVideos];
}

- (void)getSpikePromoSchedule {
    
    [BACKENDAPI loadPromoSchedule:^(id responseObject) {
        _promoScheduleData = responseObject;
        [self dismissProgress];
    } failure:^(NSError *error) {
        busyCount--;
        if (busyCount != 0)
            return;
        
        [UTILITY showHub:NO];
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

- (void)getSpikeVideos {
    
    [UTILITY showHub:YES];
    [BACKENDAPI loadVideosList:@1 success:^(id response) {
        _spikeVideos = response;
        [self dismissProgress];
    } failure:^(NSError *error) {
        busyCount--;
        if (busyCount != 0)
            return;
        
        [UTILITY showHub:NO];
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}

- (void)getFightersArray {
    
    if ([BACKENDAPI getFighters] != nil) {
        busyCount--;
        if (busyCount != 0)
            return;
    }
    
    [BACKENDAPI loadFightersList:^(id responseObject) {
        [self dismissProgress];
    } failure:^(NSError *error) {
        busyCount--;
        if (busyCount != 0)
            return;
        
        [UTILITY showHub:NO];
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
        
    }];

}

- (void)dismissProgress {
    busyCount--;
    if (busyCount != 0)
        return;
    
    [UTILITY showHub:NO];
    
    _bottomPane.hidden = NO;
    [self refreshTabButtons];
    [_videoCollectionView reloadData];
    [self constructPromoSchedulePages];
}

- (void)constructPromoSchedulePages {
    if (_promoScheduleData == nil)
        return;
    
    _arrScheduleFightVCControllers = [[NSMutableArray alloc] init];
    int pageIndex = 0;
    for (int eventIndex = 0; eventIndex < _promoScheduleData.arraySchedule.count; eventIndex++) {
        ScheduleEvent *event = _promoScheduleData.arraySchedule[eventIndex];
        if (event.fights == nil)
            continue;
        
        for (int fightIndex = 0; fightIndex < event.fights.count; fightIndex++) {
            ScheduleFight *fight = event.fights[fightIndex];
            if (fight.compustrikeId == nil)
                continue;
            
            ScheduleFightVC *subPage = (ScheduleFightVC*)[UtilityClass newViewControllerWithId:@"ScheduleFightVC" In:@"Main"];
            subPage.homeVC          = self;
            subPage.pageIndex       = pageIndex;
            subPage.scheduleFight   = fight;
            subPage.eventIndex      = eventIndex;
            [_arrScheduleFightVCControllers addObject:subPage];
                 
            pageIndex++;
        }
    }
    
    if (_arrScheduleFightVCControllers.count > 0) {
        ScheduleFightVC *firstPage = [_arrScheduleFightVCControllers objectAtIndex:0];
        [self refreshDetailInfo:firstPage];
        [_scheduleFightPageVC setViewControllers:@[firstPage] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
}

- (IBAction)onCloseVoteModeButtonClicked:(id)sender {
    _voteMode = NO;
    [self refreshUI];
    
    if (_arrScheduleFightVCControllers != nil) {
        for (int i = 0; i < _arrScheduleFightVCControllers.count; i++) {
            ScheduleFightVC *subPage = [_arrScheduleFightVCControllers objectAtIndex:i];
            [subPage refreshUI];
        }
    }
}

- (IBAction)onFightCardTabButtonClicked:(id)sender {
    tabIndex = 0;
    [self refreshTabButtons];
}

- (IBAction)onFighterInfoTabButtonClicked:(id)sender {
    tabIndex = 1;
    [self refreshTabButtons];
}

- (IBAction)onFighterVideosButtonClicked:(id)sender {
    tabIndex = 2;
    [self refreshTabButtons];
}

- (IBAction)onFullFighter1ProfileButtonClicked:(id)sender {
}

- (IBAction)onFullFighter2ProfileButtonClicked:(id)sender {
}

- (void)refreshUI {
    _fightTitlePane.hidden  = !_voteMode;
    _spikeVideosPane.hidden = _voteMode;
    _detailPane.hidden      = !_voteMode;
    
    [self refreshTabButtons];
}

- (void)refreshTabButtons {
    NSString *tabNormalBackImageName    = @"detail_tab_normal.png";
    NSString *tabPressedBackImageName   = @"detail_tab_pressed.png";
    
    _imgFightCardTab.image      = [UIImage imageNamed:(tabIndex == 0 ? tabPressedBackImageName : tabNormalBackImageName)];
    _imgFighterInfoTab.image    = [UIImage imageNamed:(tabIndex == 1 ? tabPressedBackImageName : tabNormalBackImageName)];
    _imgFighterVideosTab.image  = [UIImage imageNamed:(tabIndex == 2 ? tabPressedBackImageName : tabNormalBackImageName)];
    
    _fightCardPane.hidden       = (tabIndex != 0);
    _fighterInfoPane.hidden     = (tabIndex != 1);
    _fighterVideosPane.hidden   = (tabIndex != 2);
    
    ScheduleFightVC *currentPage = [self currentScheduleFightPage];
    if (currentPage != nil)
        [self refreshDetailInfo:currentPage];
}

- (void)refreshDetailInfo:(ScheduleFightVC*)subPage {
    if (subPage == nil)
        return;
    
    if (_promoScheduleData == nil || _promoScheduleData.arraySchedule == nil || _promoScheduleData.arraySchedule.count == 0)
        return;
    
    BOOL bShownEventTitle = NO;
    int eventIndex = subPage.eventIndex;
    if (eventIndex > 0 && eventIndex < _promoScheduleData.arraySchedule.count) {
        ScheduleEvent *event = _promoScheduleData.arraySchedule[eventIndex];
        if (event != nil) {
            bShownEventTitle = YES;
            _lblEventTitle.text = [event getTitleString];
            _lblEventDesc.text  = [event getDescString];
        }
    }
    
    _lblDefaultTitle.hidden = bShownEventTitle;
    _lblEventTitle.hidden   = !bShownEventTitle;
    _lblEventDesc.hidden    = !bShownEventTitle;
    
    if (!_voteMode)
        return;
    
    ScheduleFight* scheduleFight = subPage.scheduleFight;
    
    _lblFightTitle.text = scheduleFight._description;
    
    SpikeFighter *fighter1 = [BACKENDAPI getFighterInfo:scheduleFight.fighter1Id];
    SpikeFighter *fighter2 = [BACKENDAPI getFighterInfo:scheduleFight.fighter2Id];
    
    // Fight Card
    if (tabIndex == 0) {
        _lblRecord1.text        = fighter1.record;
        _lblTotalFights1.text   = [fighter1 getTotalFightsCountString];
        _lblAge1.text           = [fighter1 getAgeString];
        _lblHeight1.text        = [fighter1 getHeightString];
        _lblWeight1.text        = [fighter1 getWeightString];
        
        _lblRecord2.text        = fighter2.record;
        _lblTotalFights2.text   = [fighter2 getTotalFightsCountString];
        _lblAge2.text           = [fighter2 getAgeString];
        _lblHeight2.text        = [fighter2 getHeightString];
        _lblWeight2.text        = [fighter2 getWeightString];
    }
    
    // Fighter Info
    if (tabIndex == 1) {
        _lblTKOPercent1.text        = [fighter1 getTKOPercentString:YES];
        _lblSubmissionPercent1.text = [fighter1 getSubmissionPercentString];
        _lblDecisionPercent1.text   = [fighter1 getDecisionPercentString];
        
        _lblTKOPercent2.text        = [fighter2 getTKOPercentString:YES];
        _lblSubmissionPercent2.text = [fighter2 getSubmissionPercentString];
        _lblDecisionPercent2.text   = [fighter2 getDecisionPercentString];
    }
}

- (ScheduleFightVC *)currentScheduleFightPage {
    if (_scheduleFightPageVC != nil && _scheduleFightPageVC.viewControllers != nil && _scheduleFightPageVC.viewControllers.count > 0)
        return _scheduleFightPageVC.viewControllers[0];
    
    return nil;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SegueID_EmbedScheduleFightPageVC"]) {
        NSLog(@"embeded ScheduleFightPageVC");
        _scheduleFightPageVC = (UIPageViewController*)segue.destinationViewController;
        _scheduleFightPageVC.dataSource = self;
        _scheduleFightPageVC.delegate = self;
    }
}

#pragma mark - UIPageViewController Delegate

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    ScheduleFightVC *currentPage = (ScheduleFightVC*)viewController;
    if (currentPage.pageIndex <= 0)
        return nil;
    
    return [_arrScheduleFightVCControllers objectAtIndex:currentPage.pageIndex - 1];
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    ScheduleFightVC *currentPage = (ScheduleFightVC*)viewController;
    if (currentPage.pageIndex >= _arrScheduleFightVCControllers.count - 1)
        return nil;
    
    return [_arrScheduleFightVCControllers objectAtIndex:currentPage.pageIndex + 1];
}

-(void) pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (finished) {
        if ([pageViewController.viewControllers count]) {
            ScheduleFightVC *currentPage = [self currentScheduleFightPage];
            if (currentPage != nil) {
                [self refreshDetailInfo:currentPage];
            }
        }
    }
}

#pragma mark-
#pragma mark- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _spikeVideos.arrayVideos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoTableCell" forIndexPath:indexPath];
    
    SpikeVideo *spikeVideo = [_spikeVideos.arrayVideos objectAtIndex:indexPath.row];
    
    UIImageView *imgThumb       = [cell viewWithTag:1001];
    UILabel     *lblTitle       = [cell viewWithTag:1002];
    //UILabel     *lblCategory    = [cell viewWithTag:1003];
    
    [imgThumb sd_setImageWithURL:[[NSURL alloc] initWithString:[spikeVideo.mediagroup.thumbnail getThumbnailUrl:256]] placeholderImage:[UIImage imageNamed:@"video_placeholder.png"]];
    lblTitle.text = spikeVideo.title;
    //lblCategory.text = spikeVideo.mediagroup.category.text;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SpikeVideo *spikeVideo = _spikeVideos.arrayVideos[indexPath.row];
    
    VideoPlayerVC *videoPlayerVC = (VideoPlayerVC*)[UtilityClass newViewControllerWithId:@"VideoPlayerVC" In:@"Main"];
    videoPlayerVC.url = spikeVideo.mediagroup.player.url;
    [self.navigationController pushViewController:videoPlayerVC animated:YES];
}

@end
