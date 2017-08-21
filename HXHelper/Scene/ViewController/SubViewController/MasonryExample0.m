//
//  MasonryExample0.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "MasonryExample0.h"

@implementation MasonryExample0

- (void)viewDidLoad{
    [super viewDidLoad];

    UIView *superView = self.view;
    //layout constraint 布局约束
    /**
     +(instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
     view1的某个属性（attr1）等于view2的某个属性（attr2）的值的多少倍（multiplier）加上某个常量（constant）。描述的是一个view与另外一个view的位置和大小约束关系。其中属性attribute有上、下、左、右、宽、高等，关系relation有小于等于、等于、大于等于。需要注意的是，小于等于 或 大于等于 优先会使用 等于 关系，如果 等于 不能满足，才会使用 小于 或 大于。例如设置一个 大于等于100 的关系，默认会是 100，当视图被拉伸时，100 无法被满足，尺寸才会变得更大。
     需要注意的地方:
     1- 添加约束前确定已经把需要布局的子view添加到父view上了

     2- 一定要禁止将Autoresizing Mask转换为约束

     3- 要把子view的约束加在父view上

     4- 因为iOS中原点在左上角所以使用offset时注意right和bottom用负数
     
     5- 如果是设置view自身的属性，不涉及到与其他view的位置约束关系。比如view自身的宽、高等约束时，方法constraintWithItem:的第四个参数view2（secondItem）应设为nil；且第五个参数attire（secondAttribute）应设为NSLayoutAttributeNotAnAttribute 。

     6- 在设置宽和高这两个约束时，relatedBy参数使用的是 NSLayoutRelationGreaterThanOrEqual，而不是 NSLayoutRelationEqual。因为 Auto Layout 是相对布局，所以通常你不应该直接设置宽度和高度这种固定不变的值，除非你很确定视图的宽度或高度需要保持不变。
     */
    UIEdgeInsets padding = UIEdgeInsetsMake(180, 150, 160, 150);

    [superView addConstraints:@[[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1.0 constant:padding.top],[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:padding.left],[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-padding.right],[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-padding.bottom]]];

    //visual format language
    /**
     VFL的思想与其他的实现方法有所不同，他更为宏观化，他将约束分成了两块 水平方向(H:)和垂直方向(V:)

     1.@''|" 代表着边界
     2.“-”表示间隙 @“-20-” 代表20间距 也可填@“-margin-” 之后设置替换参数metrics
     3.@"[]"中括号里放的就是要添加约束的view  [redView(50)] 设置视图宽度或高度   水平方向(H:)表示宽度 垂直方向（V:）就是高度
     */

    UIView *blueView =[UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:blueView];

    NSDictionary *metrics = @{@"margin":@80};
    NSString *Hvfl = @"H:|-margin-[blueView(200)]";
    NSString *Vvfl = @"V:|-margin-[blueView(100)]";
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView);

    NSLayoutFormatOptions options = NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllLeft;
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl options:options metrics:metrics views:views];
    NSArray *hConstrains = [NSLayoutConstraint constraintsWithVisualFormat:Hvfl options:options metrics:metrics views:views];
    [superView addConstraints:vConstraints];
    [superView addConstraints:hConstrains];

}



@end
