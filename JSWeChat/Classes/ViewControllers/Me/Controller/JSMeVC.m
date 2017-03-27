//
//  JSMeVC.m
//  JSWeChat
//
//  Created by 李建舜 on 26/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSMeVC.h"
#import "JSMeView.h"
#import "JSLoginVC.h"

@interface JSMeVC ()

@end

@implementation JSMeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我";
    
    self.title = @"我";
    
    JSMeView *meView = [[JSMeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:meView];
    
    
    __weak typeof(meView) weakMeView = meView;
    __weak typeof(self) weakSelf = self;
    weakMeView.logoutBlock = ^(UIButton *sender) {
        [weakSelf logout];
    };
    
}

- (void)logout {
    EMError *error = nil;
    [[EaseMob sharedInstance].chatManager logoffWithUnbindDeviceToken:YES error:&error];
    if (!error) {
        JSLog(@"退出成功");
        JSLoginVC *loginVC = [[JSLoginVC alloc] init];
        [self presentViewController:loginVC animated:YES completion:nil];
    } else {
        JSLog(@"退出失败");
    }
}

- (void)didReceiveMemoryWarning {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
