//
//  HttpFactoryBase.m
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import "HttpFactoryBase.h"
#import "AFNetworking.h"

@interface HttpFactoryBase() {
    
}

@end

@implementation HttpFactoryBase

- (void)setTest:(id<HttpEventHanler>)handler {
}

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
        
//        AFHTTPRequestOperationManager *httpManager = [AFHTTPRequestOperationManager manager];
//        httpManager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//        [httpManager GET:baseUrl parameters:dicParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            id response = [self AnalysisData:responseObject];
//            httpSucessHandler(response);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"HttpFactory %@", error);
//            httpFailHandler();
//        }];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"GET" URLString:baseUrl parameters:dicParams error:nil];
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                NSLog(@"HttpFactory %@", error);
                httpFailHandler();
            } else {
                id response = [self AnalysisData:responseObject];
                httpSucessHandler(response);
            }
        }];
        [dataTask resume];
    }
}

- (id)AnalysisData:(id)responseObject {
    return nil;
}

@end
