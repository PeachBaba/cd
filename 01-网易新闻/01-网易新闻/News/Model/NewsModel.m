//
//  NewsModel.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/21.
//  Copyright © 2016年 c. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTool.h"
@implementation NewsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (instancetype)NewsModelWithDict:(NSDictionary *)dict{

    NewsModel *model = [[NewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
+ (void)downloadWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock{
    NSLog(@"NewsModel  %@",urlstr);
    [[NetworkTool sharedNetworlTool]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *ditc = responseObject;
        
        NSString *key = ditc.keyEnumerator.nextObject;
        
        NSArray *arr = [ditc objectForKey:key];
        
        NSMutableArray *arrM =[NSMutableArray arrayWithCapacity:arr.count];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NewsModel *model = [self NewsModelWithDict:obj];
            
            [arrM addObject:model];
        }];
        
        if (successBlock) {
            
            successBlock(arrM.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failBlock) {
            
            failBlock(error);
        }
        
    }];
    
}
@end
