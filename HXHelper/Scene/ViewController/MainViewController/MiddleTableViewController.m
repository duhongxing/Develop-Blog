//
//  MiddleTableViewController.m
//  HXHelper
//
//  Created by MacOS on 2017/8/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "MiddleTableViewController.h"

@interface MiddleTableViewController ()

@end

@implementation MiddleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MiddelVC";
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
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"identifierCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifierCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@%ld",self.title,indexPath.row];
    return cell;
}

@end
