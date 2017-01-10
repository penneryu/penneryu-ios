//
//  ListDataModel.h
//  ios
//
//  Created by 余鹏 on 2017/1/9.
//  Copyright © 2017年 penneryu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListDataModel<ObjectType> : NSObject

@property (nonatomic, assign)int status;
@property (copy, nonatomic) NSString *info;
@property (strong, nonatomic) NSMutableArray *data;


@end
