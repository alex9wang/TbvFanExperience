//
//  SliderMenuVC.h
//  UberNewUser
//
//  Created by sworld on 09/07/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "BaseVC.h"
//#import "PickUpVC.h"

@interface SliderVC : BaseVC <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView    *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel        *userName;
@property (weak, nonatomic) IBOutlet UIImageView    *imgHome;
@property (weak, nonatomic) IBOutlet UIButton       *btnHome;
@property (weak, nonatomic) IBOutlet UIImageView    *imgFighters;
@property (weak, nonatomic) IBOutlet UIButton       *btnFighters;
@property (weak, nonatomic) IBOutlet UIImageView    *imgVideos;
@property (weak, nonatomic) IBOutlet UIButton       *btnVideos;
@property (weak, nonatomic) IBOutlet UIImageView    *imgScoreCards;
@property (weak, nonatomic) IBOutlet UIButton       *btnScoreCards;
@property (weak, nonatomic) IBOutlet UIImageView    *imgMeetUp;
@property (weak, nonatomic) IBOutlet UIButton       *btnMeetUp;
@property (weak, nonatomic) IBOutlet UIImageView    *imgSettings;
@property (weak, nonatomic) IBOutlet UIButton       *btnSettings;

@end
