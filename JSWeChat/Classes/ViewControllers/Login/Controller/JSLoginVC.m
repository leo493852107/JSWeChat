//
//  JSLoginVC.m
//  JSWeChat
//
//  Created by 李建舜 on 22/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSLoginVC.h"
#import "JSLoginView.h"
#import "JSRootVC.h"
#import "JSCommonTools.h"

@interface JSLoginVC ()



@end



@implementation JSLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _loginView = [[JSLoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_loginView];
    
    __weak typeof(_loginView) weakLoginView = _loginView;
    __weak typeof(self) weakSelf = self;
    _loginView.registerBlock = ^(UIButton *sender) {

        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:weakLoginView.usernameTextField.text password:weakLoginView.passwordTextField.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
            if (!error) {
                [JSCommonTools normalAlertWithTitle:@"注册成功" WithMessage:@"恭喜注册成功" WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
            }
            
            [JSCommonTools normalAlertWithTitle:@"注册失败" WithMessage:[NSString stringWithFormat:@"%li %@", error.errorCode, error.description] WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
            
        } onQueue:nil];
        
    };
    
    _loginView.loginBlock = ^(UIButton *sender) {
        
        
        EMError *error = nil;
        NSDictionary *loginInfo = [[EaseMob sharedInstance].chatManager loginWithUsername:weakLoginView.usernameTextField.text password:weakLoginView.passwordTextField.text error:&error];
        if (!error && loginInfo) {
            // 设置自动登录
            [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
            
            [weakSelf presentViewController:[[JSRootVC alloc] init] animated:YES completion:nil];
            
        } else {
            [JSCommonTools normalAlertWithTitle:@"登录失败" WithMessage:[NSString stringWithFormat:@"%li %@", error.errorCode, error.description] WithPreferredStyle:UIAlertControllerStyleAlert WithController:weakSelf];
        }
        
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
