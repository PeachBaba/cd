//
//  HomeViewController.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/19.
//  Copyright © 2016年 c. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "channelLabel.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *ChannelScrollview;
@property (weak, nonatomic) IBOutlet UICollectionView *NewsClooectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *folwlayout;

//数据接收
@property (nonatomic,strong)NSArray *dataArr;

@end

@implementation HomeViewController

- (NSArray *)dataArr{
    
    if (_dataArr ==nil) {
        
        _dataArr =[ChannelModel channels];
    }
    
    return _dataArr;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    self.folwlayout.itemSize = self.NewsClooectionView.bounds.size;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self creatChannelLab];
}

- (void)creatChannelLab{
    
    int LabW = 80;
    
    int LabH = self.ChannelScrollview.bounds.size.height;
    
    for (int i = 0; i < self.dataArr.count; i ++) {
        
        channelLabel *lab = [[channelLabel alloc]init];
        
        lab.frame = CGRectMake(LabW * i , 0, LabW, LabH);
        
        ChannelModel *model = self.dataArr[i];
        
        lab.text = model.tname;
        
        lab.tag = i;
        
        [self.ChannelScrollview addSubview:lab];
        
        self.ChannelScrollview.contentSize = CGSizeMake(LabW * self.dataArr.count, 0);
    }

}

#pragma make 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeViewController" forIndexPath:indexPath];
    
    ChannelModel *model = self.dataArr[indexPath.item];
    
    NSString *urlstr = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    
    cell.urlstr = urlstr;
    
    return cell;
}
@end
