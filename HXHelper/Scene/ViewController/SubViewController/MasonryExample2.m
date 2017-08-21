//
//  MasonryExample2.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "MasonryExample2.h"

@interface MasonryExample2 ()

@end

@implementation MasonryExample2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self example];
}

- (void)example{
    //        make.edges.equalTo(self.view);

    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(70, 50, 50, 50));
    }];
}

- (void)updateViewConstraints{
    //remake/update constraints here
    [super updateViewConstraints];

    [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@90);
        make.height.equalTo(@100);
    }];
}



@end
