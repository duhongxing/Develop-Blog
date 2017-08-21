//
//  MasonryExample1.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "MasonryExample1.h"

@interface MasonryExample1 ()

@end

@implementation MasonryExample1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self exmaple1];

    [self exmaple2];

    [self example3];
}

/**
 UIView
 make.left.greaterThanOrEqualTo(label);
 */

- (void)exmaple1{
    
    UIEdgeInsets paddings = UIEdgeInsetsMake(80, 80, 80, 80);
    UIView *superView = self.view;
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(paddings.top);
        make.left.equalTo(superView.mas_left).with.offset(paddings.left);
        make.bottom.equalTo(superView.mas_bottom).with.offset(-paddings.bottom);
        make.right.equalTo(superView.mas_right).with.offset(-paddings.right);
    }];

    UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 100, 100);
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView).with.insets(insets);
    }];
}

/**
 NSNumber
 make.width.equalTo(@50);
*/
- (void)exmaple2{

    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.redView.mas_centerX);
        make.centerY.equalTo(self.redView.mas_centerY);
        make.width.equalTo(@50);
        make.height.equalTo(@60);
    }];
}

/**
 MASViewAttribute:

 MASViewAttribute	NSLayoutAttribute
 view.mas_left	NSLayoutAttributeLeft
 view.mas_right	NSLayoutAttributeRight
 view.mas_top	NSLayoutAttributeTop
 view.mas_bottom	NSLayoutAttributeBottom
 view.mas_leading	NSLayoutAttributeLeading
 view.mas_trailing	NSLayoutAttributeTrailing
 view.mas_width	NSLayoutAttributeWidth
 view.mas_height	NSLayoutAttributeHeight
 view.mas_centerX	NSLayoutAttributeCenterX
 view.mas_centerY	NSLayoutAttributeCenterY
 view.mas_baseline	NSLayoutAttributeBaseline

 make.centerX.lessThanOrEqualTo(view2.mas_left);
 */
- (void)example3{

    UIView *blueView =[UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    UIView *superView = self.view;
    [superView addSubview:blueView];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;

    [superView insertSubview:blueView belowSubview:self.greenView];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.redView.mas_centerX);
        make.centerY.equalTo(self.redView.mas_centerY);
        make.width.equalTo(@80);
        make.height.equalTo(@90);
    }];

}

@end
