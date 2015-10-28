//
//  ChannelHttpFactory.m
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "ChannelHttpFactory.h"
#import "ChannelInfo.h"

@implementation ChannelHttpFactory

- (NSString *)createBaseUrl {
    return @"http://9.fanli.com/app/v2/channel";;
}

- (id)AnalysisData:(id)responseObject {
    NSDictionary *dictionary = (NSDictionary *)responseObject;
    NSArray *datas = (NSArray *)dictionary[@"data"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[datas count]];
    for (NSDictionary *value in datas) {
        ChannelInfo *info = [[ChannelInfo alloc]init];
        info.cid =  [(NSString *)value[@"id"] intValue];
        info.name = (NSString *)value[@"name"];
        [array addObject:info];
    }
    return array;
}

@end
