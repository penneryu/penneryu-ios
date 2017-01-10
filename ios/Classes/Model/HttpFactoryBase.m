//
//  HttpFactoryBase.m
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "HttpFactoryBase.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import <objc/runtime.h>


@implementation HttpFactoryBase

- (void)setHttpHandler:(void (^)(id responseObject))sucessHandler faliure:(void (^)(void)) failHandler {
    httpSucessHandler = sucessHandler;
    httpFailHandler = failHandler;
}

- (NSString *)createBaseUrl {
    return nil;
}

- (NSMutableDictionary *)createUrlParams:(NSMutableArray *)params {
    return nil;
}

- (void)downloadDatas:(NSString *)args, ... {
    if (args) {
        va_list arg_list;
        va_start(arg_list, args);
        NSString *arg;
        params = [NSMutableArray array];
        [params addObject:args];
        while ((arg = va_arg(arg_list, NSString *))) {
            [params addObject:arg];
        }
        va_end(arg_list);
    }
    NSString *baseUrl = [self createBaseUrl];
    NSMutableDictionary *dicParams = [self createUrlParams:params];
    
    if (baseUrl) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"GET" URLString:baseUrl parameters:dicParams error:nil];
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                NSLog(@"HttpFactory %@", error);
                httpFailHandler();
            } else {
                [self processModelClass];
                id response = [NSClassFromString([self getModelClass]) mj_objectWithKeyValues:responseObject];
                httpSucessHandler(response);
            }
        }];
        [dataTask resume];
    }
}

- (NSString *)getModelClass {
    return @"ListDataModel";
}

- (void)processModelClass {
}

@end
