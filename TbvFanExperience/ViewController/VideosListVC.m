//
//  VideosListVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "VideosListVC.h"
#import "VideoPlayerVC.h"
#import "UIImageView+WebCache.h"


@interface VideosListVC () {
    NSMutableArray *arrVideos;
}

@end

@implementation VideosListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSliderMenuButton];
    
    arrVideos = [NSMutableArray new];
    
    [self getSpikeVideos];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}



#pragma mark -
#pragma mark - call BackEnd API

- (void)getSpikeVideos {
    
    [UTILITY showHub:YES];
    [BACKENDAPI loadVideosList:@1 success:^(id response) {
        
        [UTILITY showHub:NO];
        
        SpikeVideos *videos = response;
        arrVideos = videos.arrayVideos;

        [_tableView reloadData];
    } failure:^(NSError *error) {
        
        [UTILITY showHub:NO];
        [UTILITY showMessage:NSLocalizedString(@"NO_INTERNET", nil)];
    }];
}


#pragma mark -
#pragma mark - UITableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrVideos.count;
}

-(NSInteger)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width * 9 / 16;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoTableCell"];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoTableCell"];
    }
    
    SpikeVideo *spikeVideo = [arrVideos objectAtIndex:indexPath.row];
    
    UIImageView *imgThumb       = [cell viewWithTag:1001];
    UILabel     *lblTitle       = [cell viewWithTag:1002];
    //UILabel     *lblCategory    = [cell viewWithTag:1003];
    
    [imgThumb sd_setImageWithURL:[[NSURL alloc] initWithString:[spikeVideo.mediagroup.thumbnail getThumbnailUrl:256]] placeholderImage:[UIImage imageNamed:@"video_placeholder.png"]];
    lblTitle.text       = spikeVideo.title;
    //lblCategory.text    = spikeVideo.mediagroup.category.text;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SpikeVideo *spikeVideo = [arrVideos objectAtIndex:indexPath.row];
    
    VideoPlayerVC *videoPlayerVC = (VideoPlayerVC*)[UtilityClass newViewControllerWithId:@"VideoPlayerVC" In:@"Main"];
    videoPlayerVC.url = spikeVideo.mediagroup.player.url;
    [self.navigationController pushViewController:videoPlayerVC animated:YES];
}

@end
