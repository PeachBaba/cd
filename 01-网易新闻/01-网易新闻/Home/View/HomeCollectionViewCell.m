//
//  HomeCollectionViewCell.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/21.
//  Copyright © 2016年 c. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h"

@interface HomeCollectionViewCell ()

@property (nonatomic,strong)NewsTableViewController *newsVc;

@end

@implementation HomeCollectionViewCell
- (void)awakeFromNib{
//    self.backgroundColor =[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"news" bundle:nil];
    self.newsVc = [sb instantiateInitialViewController];
    
    self.newsVc.tableView.frame = self.contentView.bounds;
    
    self.newsVc.tableView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self addSubview:self.newsVc.tableView];
}

- (void)setUrlstr:(NSString *)urlstr{
    
    _urlstr = urlstr;
    
    self.newsVc.urlstr = urlstr;
}

@end
