//
//  HXBaseViewController.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "HXBaseViewController.h"

@interface HXBaseViewController ()

@end

@implementation HXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;

    [self setupViews];
}

- (void)setupViews{
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter/setter

- (UIView *)redView{
    if (!_redView) {
        _redView = [UIView new];
        _redView.backgroundColor =[UIColor redColor];
        _redView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _redView;
}

- (UIView *)yellowView{
    if (!_yellowView) {
        _yellowView =[UIView new];
        _yellowView.backgroundColor =[UIColor yellowColor];
        _yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _yellowView;
}

- (UIView *)greenView{
    if (!_greenView) {
        _greenView =[UIView new];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _greenView;
}

@end
