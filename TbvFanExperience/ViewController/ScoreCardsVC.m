//
//  ScoreCardsVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "ScoreCardsVC.h"

@interface ScoreCardsVC ()

@end

@implementation ScoreCardsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSliderMenuButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}


@end
