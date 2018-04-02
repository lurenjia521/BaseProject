//
//  MMButton.m
//  SBookshop
//
//  Created by boolean on 16/8/16.
//  Copyright © 2016年 evolt. All rights reserved.
//

#import "MMButton.h"

@interface MMButton ()



@end

@implementation MMButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat space = self.spaceBetweenTitleAndImage;
    

    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);//titleLabel的宽度
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);//titleLabel的高度
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);//imageView的宽度
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);//imageView的高度
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;//按钮中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat imageCenterX = btnCenterX - titleW/2;//imageView中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat titleCenterX = btnCenterX + imageW/2;//titleLabel中心点X的坐标（以按钮左上角为原点的坐标系）

    switch (self.imageAlignment)
    {
        case MMImageAlignmentTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(imageH/2+ space/2, -(imageW), -(imageH/2 + space/2), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleH/2 + space/2), btnCenterX-imageCenterX-imageW, titleH/2+ space/2, -(btnCenterX-imageCenterX+imageW));
            
            self.line.frame = CGRectMake(self.titleLabel.left, self.height-1.5f, self.titleLabel.width, 1.5f);
            [self addSubview:_line];
            
        }
            break;
        case MMImageAlignmentLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0,  -space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space);
        }
            break;
        case MMImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageH/2+ space/2), -(titleCenterX-btnCenterX), imageH/2 + space/2, titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(titleH/2 + space/2, btnCenterX-imageCenterX,-(titleH/2+ space/2), -(btnCenterX-imageCenterX));
        }
            break;
        case MMImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
        default:
            break;
    }
}




-(UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        
        _line.backgroundColor = [UIColor clearColor];
    }
    return _line;
}

@end