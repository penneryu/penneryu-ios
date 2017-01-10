//
//  ChannelHttpFactory.m
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "ChannelHttpFactory.h"
#import "ListDataModel.h"
#import "MJExtension.h"

@implementation ChannelHttpFactory

- (NSString *)createBaseUrl {
    return @"http://9.fanli.com/app/v2/channel";;
}

- (void)processModelClass {
    [ListDataModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
            @"data" : @"ChannelInfo"
        };
    }];
}

@end
