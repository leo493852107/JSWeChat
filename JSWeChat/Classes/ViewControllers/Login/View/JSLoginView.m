//
//  JSLoginView.m
//  JSWeChat
//
//  Created by 李建舜 on 23/03/2017.
//  Copyright © 2017 李建舜. All rights reserved.
//

#import "JSLoginView.h"

@implementation JSLoginView


#pragma mark - 懒加载
- (UITextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTextField.placeholder = @"请输入账号";
    }
    return _usernameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UILabel *)usernameLabel {
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.text = @"用户名:";
        _usernameLabel.font = [UIFont systemFontOfSize:14];
        _usernameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _usernameLabel;
}

- (UILabel *)passwordLabel {
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.text = @"密码:";
        _passwordLabel.font = [UIFont systemFontOfSize:14];
        _passwordLabel.textAlignment = NSTextAlignmentRight;
    }
    return _passwordLabel;
}


#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.usernameLabel];
    [self addSubview:self.passwordLabel];
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    
    
    
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(100);
        make.left.mas_equalTo(self).offset(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_usernameLabel);
        make.left.mas_equalTo(_usernameLabel.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-20);
        make.height.mas_equalTo(_usernameLabel);
    }];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameLabel).offset(50);
        make.left.mas_equalTo(self).offset(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passwordLabel);
        make.left.mas_equalTo(_passwordLabel.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-20);
        make.height.mas_equalTo(_passwordLabel);
    }];
    
    
}

@end
