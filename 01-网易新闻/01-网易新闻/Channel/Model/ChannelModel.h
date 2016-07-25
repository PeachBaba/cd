//
//  ChannelModel.h
//  01-网易新闻
//
//  Created by 阿么 on 16/7/19.
//  Copyright © 2016年 c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, copy)NSString *tname;

@property (nonatomic,copy)NSString *tid;

+ (NSArray *)channels;
@end
