//
//  ChannelModel.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/19.
//  Copyright © 2016年 c. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@",_tid,_tname];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (instancetype)channelModelWithDict:(NSDictionary *)dict{
    
    ChannelModel *model = [[ChannelModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
#pragma make 解析
+ (NSArray *)channels{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *arr = [dict objectForKey:@"tList"];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
    
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ChannelModel *model = [self channelModelWithDict:obj];
        
        [arrM addObject:model];
        
    }];
    
    [arrM sortUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    return arrM.copy;
}

@end
