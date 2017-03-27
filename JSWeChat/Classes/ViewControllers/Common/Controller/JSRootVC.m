//
//  JSRootVC.m
//  JSWeChat
//
//  Created by 李建舜 on 26/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSRootVC.h"
#import "JSBaseNavController.h"
#import "JSHomeVC.h"
#import "JSMeVC.h"

@interface JSRootVC ()

@end

@implementation JSRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    JSHomeVC *home = [[JSHomeVC alloc] init];
    JSBaseNavController *homeNav = [[JSBaseNavController alloc] initWithRootViewController:home];
    [self addChildViewController:homeNav];
    
    JSMeVC *me = [[JSMeVC alloc] init];
    JSBaseNavController *meNav = [[JSBaseNavController alloc] initWithRootViewController:me];
    [self addChildViewController:meNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
