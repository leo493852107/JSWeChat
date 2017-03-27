//
//  JSHomeVC.m
//  JSWeChat
//
//  Created by 李建舜 on 26/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSHomeVC.h"


@interface JSHomeVC ()

@end

@implementation JSHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initUI];
    
    
}


- (void)initUI {
    
    self.title = @"主页";
    
    self.navigationItem.title = @"主页";
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
