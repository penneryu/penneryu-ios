//
//  AsyncImageView.m
//  ios
//
//  Created by 余鹏 on 2017/1/4.
//  Copyright © 2017年 penneryu. All rights reserved.
//

#import "AsyncImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation AsyncImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setImageURL:(NSString *)url {
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setImageURL:(NSString *)url placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}

@end
