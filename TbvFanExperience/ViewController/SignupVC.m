//
//  SignupVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "SignupVC.h"
#import "Util.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface SignupVC ()
{
    BOOL isPicAdded;
}
@end

@implementation SignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgAvatar.layer.cornerRadius   = self.imgAvatar.bounds.size.height / 2;
    self.imgAvatar.contentMode          = UIViewContentModeScaleAspectFill;
    self.imgAvatar.clipsToBounds        = YES;
    isPicAdded = false;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _txtUserName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_txtUserName.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    _txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_txtPassword.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    _txtConfirm.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_txtConfirm.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

- (IBAction)onBackButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSignupButtonClicked:(id)sender {
    
    if (![self checkInputState]) {
        return;
    }
    
    NSMutableDictionary *dictParam=[[NSMutableDictionary alloc]init];
    [dictParam setValue:_txtUserName.text forKey:@"username"];
    [dictParam setValue:_txtPassword.text forKey:@"password"];
    
    if(isPicAdded == YES) {
        UIImage *imgUpload = [UTILITY scaleAndRotateImage:_imgAvatar.image];
        
        [UTILITY showHub:YES];
        AFNHelper *afn = [[AFNHelper alloc]initWithRequestMethod:POST_METHOD];
        [afn requestHttp:SIGNUP_API withParam:dictParam withImage:imgUpload withBlock:^(id response, NSError *error) {
            [UTILITY showHub:NO];
            [self gotoHome:response];
        }];
    } else {
        [UTILITY showHub:YES];
        AFNHelper *afn=[[AFNHelper alloc]initWithRequestMethod:POST_METHOD];
        [afn requestHttp:SIGNUP_API withParam:dictParam withBlock:^(id response, NSError *error) {
            [UTILITY showHub:NO];
            [self gotoHome:response];
        }];
    }
}

- (void)gotoHome:(id)response {
    
    if (!response)
        return;
    
    if (![[response valueForKey:@"success"] boolValue]) {
        NSString *str=[NSString stringWithFormat:@"%@",[response valueForKey:@"error_message"]];
        [UTILITY showMessage:str];
        return;
    }
    
    NSDictionary *dictData = [response valueForKey:@"data"];
    APPDELEGATE.userInfo = [[UserInfo alloc] initJsonData:dictData];
    
    [PREF setObject:_txtUserName.text forKey:PREF_USERNAME];
    [PREF setObject:_txtPassword.text forKey:PREF_PASSWORD];
    [PREF setBool:YES forKey:PREF_IS_LOGIN];
    [PREF synchronize];
    
    [UTILITY gotoViewController:self vcId:@"SWRevealVC"];
}


- (BOOL)checkInputState {
    NSString *message = nil;
    UITextField* wrongTextField = nil;
    
    if (_txtUserName.text.length<1) {
        message = @"Please enter user name";
        wrongTextField = _txtUserName;
    } else if(_txtPassword.text.length<1) {
        message = @"Please enter password";
        wrongTextField = _txtPassword;
    } else if(![_txtPassword.text isEqualToString:_txtConfirm.text]) {
        message = @"Password is not match";
        wrongTextField = _txtConfirm;
    }
    
    if (wrongTextField != nil)
    {
        [UTILITY showMessage:self message:message];
        //[wrongTextField becomeFirstResponder];
        
        return NO;
    }
    
    return YES;
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
            Byte *buffer = (Byte*)malloc((int)rep.size);
            NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:(int)rep.size error:nil];
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

-(void)setImage:(UIImage *)image
{
    self.imgAvatar.image = image;
    self.imgAvatar.layer.cornerRadius = self.imgAvatar.bounds.size.height / 2;
    self.imgAvatar.contentMode = UIViewContentModeScaleAspectFill;
    self.imgAvatar.clipsToBounds = YES;
    isPicAdded=YES;
}

#pragma mark -
#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField==self.txtUserName)
        [self.txtPassword becomeFirstResponder];
    else if(textField==self.txtPassword)
        [self.txtConfirm becomeFirstResponder];
    else
        [textField resignFirstResponder];
    return YES;
}

@end
