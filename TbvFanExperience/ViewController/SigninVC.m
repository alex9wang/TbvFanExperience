//
//  SigninVC.m
//  TbvFanExperience
//
//  Created by great summit an on 8/5/16.
//  Copyright © 2016 great summit an. All rights reserved.
//

#import "SigninVC.h"

@interface SigninVC ()

@end

@implementation SigninVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _txtUserName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_txtUserName.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    _txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_txtPassword.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

- (IBAction)onSigninButtonClicked:(id)sender {
    
    NSMutableDictionary *dictParam=[[NSMutableDictionary alloc]init];
    [dictParam setValue:_txtUserName.text forKey:@"username"];
    [dictParam setValue:_txtPassword.text forKey:@"password"];
    
    [UTILITY showHub:YES];
    AFNHelper *afn=[[AFNHelper alloc]initWithRequestMethod:POST_METHOD];
    [afn requestHttp:SIGNIN_API withParam:dictParam withBlock:^(id response, NSError *error) {
        
        [UTILITY showHub:NO];
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
    }];
}

#pragma mark -
#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField==self.txtUserName)
        [self.txtPassword becomeFirstResponder];
    else
        [textField resignFirstResponder];
    return YES;
}

@end
