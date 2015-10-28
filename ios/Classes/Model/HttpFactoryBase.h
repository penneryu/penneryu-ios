//
//  HttpFactoryBase.h
//  ios
//
//  Created by sh587 on 15/10/28.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpEventHanler <NSObject>

- (void)httpSucessHandler:(id)result;
- (void)httpFailHandler;

@end

@interface HttpFactoryBase : NSObject {
    
    NSMutableArray *params;
    void (^httpSucessHandler)(id);
    void (^httpFailHandler)(void);
}

- (NSString *)createBaseUrl;
- (NSMutableDictionary *)createUrlParams:(NSMutableArray *)params;
- (void)setTest:(id<HttpEventHanler>)handler;
- (void)downloadDatas:(NSString *)args, ...;
- (void)setHttpHandler:(void (^)(id))sucessHandler faliure:(void (^)(void)) failHandler;
- (id)AnalysisData:(id)responseObject;

@end
