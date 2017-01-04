//
//  AsyncImageView.h
//  ios
//
//  Created by 余鹏 on 2017/1/4.
//  Copyright © 2017年 penneryu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsyncImageView : UIImageView

- (void)setImageURL:(NSString *)url;
- (void)setImageURL:(NSString *)url placeholder:(NSString *)placeholder;

@end
