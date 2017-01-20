//
//  VideoPlayerVC.h
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPlayerVC : BaseVC

@property (weak, nonatomic) IBOutlet UIView *videoView;

@property NSString                          *url;

@end

