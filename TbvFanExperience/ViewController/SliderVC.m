//
//  SliderMenuVC.m
//  UberNewUser
//
//  Created by sworld on 09/07/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//


#import "SliderVC.h"
#import "SWRevealViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIImageView+WebCache.h"


#define kNavItemHome            0
#define kNavItemFighters        1
#define kNavItemVideos          2
#define kNavItemScoreCards      3
#define kNavItemMeetUp          4
#define kNavItemSettings        5

#define kNavItemSelectedColor   [UIColor whiteColor]
#define kNavItemDefaultColor    [UIColor lightGrayColor]

@interface SliderVC ()
{
    int selectedNavItem;
}
@end

@implementation SliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.revealViewController panGestureRecognizer];
    [self.revealViewController tapGestureRecognizer];
    
    self.imgAvatar.layer.cornerRadius   = self.imgAvatar.bounds.size.height / 2;
    self.imgAvatar.contentMode          = UIViewContentModeScaleAspectFill;
    self.imgAvatar.clipsToBounds        = YES;
    
    self.userName.text  = APPDELEGATE.userInfo.username;
    [self.imgAvatar sd_setImageWithURL:[[NSURL alloc] initWithString:APPDELEGATE.userInfo.picture] placeholderImage:[UIImage imageNamed:@"avatar_mark.png"]];
    
    selectedNavItem = kNavItemHome;
    [self refreshUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.revealViewController.frontViewController.view setUserInteractionEnabled:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.revealViewController.frontViewController.view setUserInteractionEnabled:YES];
}

- (IBAction)onHomeButtonClicked:(id)sender {
    
    selectedNavItem = kNavItemHome;
    [self refreshUI];
    
    [self changeActiveViewController:@"HomeVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onFightersButtonClicked:(id)sender {
    
    selectedNavItem = kNavItemFighters;
    [self refreshUI];
    
    [self changeActiveViewController:@"FightersListVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onVideosButtonClicked:(id)sender {
    
    selectedNavItem = kNavItemVideos;
    [self refreshUI];
    
    [self changeActiveViewController:@"VideosListVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onScoreCardsButtonClicked:(id)sender {
    selectedNavItem = kNavItemScoreCards;
    [self refreshUI];
    
    [self changeActiveViewController:@"ScoreCardsVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onMeetUpButtonClicked:(id)sender {
    selectedNavItem = kNavItemMeetUp;
    [self refreshUI];
    
    [self changeActiveViewController:@"MeetUpVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onSettingsButtonClicked:(id)sender {
    selectedNavItem = kNavItemSettings;
    [self refreshUI];
    
    [self changeActiveViewController:@"SettingsVC"];
    [self.revealViewController rightRevealToggle:self];
}

- (IBAction)onLogoutButtonClicked:(id)sender {
    [self.revealViewController rightRevealToggle:self];
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeActiveViewController:(NSString *)vcIdentifier {
    UIViewController *vc = [UtilityClass newViewControllerWithId:vcIdentifier In:@"Main"];
    [self.revealViewController setFrontViewController:vc animated:NO];
}

- (void)refreshUI {
    [self setBoldStyle:_btnHome         withBold:selectedNavItem == kNavItemHome];
    [self setBoldStyle:_btnFighters     withBold:selectedNavItem == kNavItemFighters];
    [self setBoldStyle:_btnVideos       withBold:selectedNavItem == kNavItemVideos];
    [self setBoldStyle:_btnScoreCards   withBold:selectedNavItem == kNavItemScoreCards];
    [self setBoldStyle:_btnMeetUp       withBold:selectedNavItem == kNavItemMeetUp];
    [self setBoldStyle:_btnSettings     withBold:selectedNavItem == kNavItemSettings];
    
    [_imgHome       setImage:[UIImage imageNamed:selectedNavItem == kNavItemHome        ? @"home.png"       : @"home_gray.png"]];
    [_imgFighters   setImage:[UIImage imageNamed:selectedNavItem == kNavItemFighters    ? @"user.png"       : @"user_gray.png"]];
    [_imgVideos     setImage:[UIImage imageNamed:selectedNavItem == kNavItemVideos      ? @"video.png"      : @"video_gray.png"]];
    [_imgScoreCards setImage:[UIImage imageNamed:selectedNavItem == kNavItemScoreCards  ? @"score.png"      : @"score_gray.png"]];
    [_imgMeetUp     setImage:[UIImage imageNamed:selectedNavItem == kNavItemMeetUp      ? @"map.png"        : @"map_gray.png"]];
    [_imgSettings   setImage:[UIImage imageNamed:selectedNavItem == kNavItemSettings    ? @"setting.png"    : @"setting_gray.png"]];
    
    [_btnHome       setTitleColor:selectedNavItem == kNavItemHome       ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
    [_btnFighters   setTitleColor:selectedNavItem == kNavItemFighters   ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
    [_btnVideos     setTitleColor:selectedNavItem == kNavItemVideos     ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
    [_btnScoreCards setTitleColor:selectedNavItem == kNavItemScoreCards ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
    [_btnMeetUp     setTitleColor:selectedNavItem == kNavItemMeetUp     ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
    [_btnSettings   setTitleColor:selectedNavItem == kNavItemSettings   ? kNavItemSelectedColor : kNavItemDefaultColor forState:UIControlStateNormal];
}

- (void)setBoldStyle:(UIButton*)button withBold:(BOOL)bold {
    if (button == nil)
        return;

    if (bold)
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    else
        button.titleLabel.font = [UIFont systemFontOfSize:16];
}

- (IBAction)onPhotoButtonClicked:(id)sender {
    UIAlertController *alert    = [UIAlertController alertControllerWithTitle:nil
                                                                      message:nil
                                                               preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *takePhoto    = [UIAlertAction actionWithTitle:@"Take Photo"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                             [self takePhoto];
                                                         }];
    UIAlertAction *selectImage  = [UIAlertAction actionWithTitle:@"Select Image"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                             [self selectPhotos];
                                                         }];
    UIAlertAction *cancel       = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    
    [alert addAction:takePhoto];
    [alert addAction:selectImage];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark
#pragma mark - Action to Share

- (void)selectPhotos {
    // Set up the image picker controller and add it to the view
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing=YES;
    [self presentViewController:imagePickerController animated:YES completion:^{
        
    }];
}

-(void)takePhoto {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType =UIImagePickerControllerSourceTypeCamera;
        imagePickerController.allowsEditing=YES;
        [self presentViewController:imagePickerController animated:YES completion:^{
        }];
        
    } else {
        [UTILITY showMessage:self message:@"Camera Not Available"];
    }  // Set up the image picker controller and add it to the view
}


#pragma mark
#pragma mark - ImagePickerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([info valueForKey:UIImagePickerControllerEditedImage]==nil)
    {
        ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
        [assetLibrary assetForURL:[info valueForKey:UIImagePickerControllerReferenceURL] resultBlock:^(ALAsset *asset) {
            ALAssetRepresentation *rep = [asset defaultRepresentation];
            Byte *buffer = (Byte*)malloc(rep.size);
            NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
            NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];//
            UIImage *img=[UIImage imageWithData:data];
            [self setImage:img];
        } failureBlock:^(NSError *err) {
            NSLog(@"Error: %@",[err localizedDescription]);
        }];
    }
    else
    {
        [self setImage:[info valueForKey:UIImagePickerControllerEditedImage]];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)setImage:(UIImage *)image {
    self.imgAvatar.image = image;
    self.imgAvatar.layer.cornerRadius = self.imgAvatar.bounds.size.height / 2;
    self.imgAvatar.contentMode = UIViewContentModeScaleAspectFill;
    self.imgAvatar.clipsToBounds = YES;
}

@end
