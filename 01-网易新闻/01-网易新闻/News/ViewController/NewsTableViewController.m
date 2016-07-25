//
//  NewsTableViewController.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/21.
//  Copyright © 2016年 c. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic,strong)NSArray *dataArr;
@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setUrlstr:(NSString *)urlstr{
    
    [NewsModel downloadWithUrlstr:urlstr successBlock:^(NSArray *arr) {
        
        self.dataArr = arr;
        //刷新表格
        [self.tableView reloadData];
        
    } failBlock:^(NSError *error) {
         NSLog(@"error %@",error);
    }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell"];
    
    NewsModel *model = self.dataArr[indexPath.row];
    
    cell.model = model;
    

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
@end
