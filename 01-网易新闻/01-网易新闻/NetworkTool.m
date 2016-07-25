//
//  NetworkTool.m
//  01-网易新闻
//
//  Created by 阿么 on 16/7/21.
//  Copyright © 2016年 c. All rights reserved.
//

#import "NetworkTool.h"
#import <AFNetworking.h>

@implementation NetworkTool

static id _instancetype;

+(instancetype)sharedNetworlTool{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseurl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        _instancetype = [[self alloc]initWithBaseURL:baseurl];
    });
    
    return _instancetype;
}
@end
