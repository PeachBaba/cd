//
//  NetworkTool.h
//  01-网易新闻
//
//  Created by 阿么 on 16/7/21.
//  Copyright © 2016年 c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetworkTool : AFHTTPSessionManager
+(instancetype)sharedNetworlTool;
@end
