//
//  FightersListVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "FightersListVC.h"
#import "UIImageView+WebCache.h"

@interface FightersListVC () {
    NSMutableArray *arrFighters;
}

@end

@implementation FightersListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSliderMenuButton];
    
    arrFighters = [BACKENDAPI getFighters];
    [_tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}


#pragma mark -
#pragma mark - UITableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrFighters.count;
}

-(NSInteger)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width / 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FighterTableCell"];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FighterTableCell"];
    }
    
    SpikeFighter *fighter = [arrFighters objectAtIndex:indexPath.row];
    
    UIImageView *imgThumb   = [cell viewWithTag:1001];
    UILabel     *lblRecord  = [cell viewWithTag:1002];
    UILabel     *lblName    = [cell viewWithTag:1003];
    
    if (fighter.compustrikeId != nil) {
        NSString *photoUrl = [BACKENDAPI getFighterPhotoUrl:fighter.compustrikeId imageType:@"head" width:@(200)];
        [imgThumb sd_setImageWithURL:[[NSURL alloc] initWithString:photoUrl] placeholderImage:[UIImage imageNamed:@"player_avatar_mark.png"]];
    } else {
        imgThumb.image = [UIImage imageNamed:@"player_avatar_mark.png"];
    }
    
    NSString* firstName = [UTILITY getString:fighter.firstName placeholder:kStringUnknown];
    NSString* lastName  = [UTILITY getString:fighter.lastName placeholder:kStringUnknown];
    
    lblRecord.text  = [UTILITY getString:fighter.record placeholder:kStringUnknown];
    lblName.text    = [[NSString stringWithFormat:@"%@\n%@", firstName, lastName] uppercaseString];
    
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [UIColor colorWithRed:1.0
                                                      green:1.0
                                                       blue:1.0
                                                      alpha:0.1];
    cell.selectedBackgroundView = customColorView;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //SpikeFighter *fighter = [arrFighters objectAtIndex:indexPath.row];
    
//    VideoPlayerVC *videoPlayerVC = (VideoPlayerVC*)[UtilityClass newViewControllerWithId:@"VideoPlayerVC" In:@"Main"];
//    videoPlayerVC.url = spikeVideo.mediagroup.player.url;
//    [self.navigationController pushViewController:videoPlayerVC animated:YES];
}

@end
