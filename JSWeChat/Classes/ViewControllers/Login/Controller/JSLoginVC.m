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

@interface JSLoginVC ()


@end


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
        EMError *error = nil;
        BOOL isSuccess = [[EaseMob sharedInstance].chatManager registerNewAccount:weakLoginView.usernameTextField.text password:weakLoginView.passwordTextField.text error:&error];
        if (isSuccess) {
            JSLog(@"注册成功");
            JSRootVC *rootVC = [[JSRootVC alloc] init];
            [weakSelf.navigationController pushViewController:rootVC animated:YES];
        } else {
            JSLog(@"注册失败");
        }
    };
    
    _loginView.loginBlock = ^(UIButton *sender) {
        
        
        EMError *error = nil;
        NSDictionary *loginInfo = [[EaseMob sharedInstance].chatManager loginWithUsername:weakLoginView.usernameTextField.text password:weakLoginView.passwordTextField.text error:&error];
        if (!error && loginInfo) {
            JSLog(@"登录成功");
            // 设置自动登录
            [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
            
            [weakSelf presentViewController:[[JSRootVC alloc] init] animated:YES completion:nil];
            
        } else {
            JSLog(@"登录失败");
        }
        
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
