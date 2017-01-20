//
//  VideoPlayerVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "VideoPlayerVC.h"

@interface VideoPlayerVC ()

@end

@implementation VideoPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onBackButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
