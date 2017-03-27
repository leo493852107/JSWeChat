//
//  JSMeView.m
//  JSWeChat
//
//  Created by 李建舜 on 27/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#define marginLeftRight 20

#import "JSMeView.h"

@implementation JSMeView

#pragma mark - 懒加载
- (UIButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logoutBtn.backgroundColor = [UIColor redColor];
        [_logoutBtn.layer setMasksToBounds:YES];
        [_logoutBtn.layer setCornerRadius:3.0];
        [_logoutBtn addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

#pragma mark - 监听事件
- (void)registerButtonClick:(UIButton *)button {
    
    if (self.logoutBlock) {
        self.logoutBlock(button);
        
    }
    
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    
    [self addSubview:self.logoutBtn];
    
    [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(100);
        make.left.mas_equalTo(self).offset(marginLeftRight);
        make.right.mas_equalTo(self).offset(-marginLeftRight);
        make.height.mas_equalTo(30);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
