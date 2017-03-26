//
//  JSLoginVC.m
//  JSWeChat
//
//  Created by 李建舜 on 22/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSLoginVC.h"
#import "JSLoginView.h"

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
    
    
//    _loginView.registerBlock = ^(UIButton *sender) {
//        JSLog(@"111");
//    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
