//
//  MainTableViewController.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LeftVC";

    [self setupTab];
}

- (void)setupTab{
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"identifierCellA"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifierCellA"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"MasonryExample%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class vcClass  = NSClassFromString([NSString stringWithFormat:@"MasonryExample%ld",indexPath.row]);
    UIViewController *vc =(UIViewController *)[[vcClass alloc]init];
    vc.view.backgroundColor =[UIColor whiteColor];
    vc.title = NSStringFromClass([vc class]);
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
