//
//  ChocolateSegmentedControl.m
//  UISegmentedControl_iOS
//
//  Created by Mac on 16/3/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ChocolateSegmentedControl.h"
#define MYHEIGHT self.frame.size.height-2

@implementation ChocolateSegmentedControl
{
    UIView *lineView;
}
//-(instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        
//    }
//    return self;
//}
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray backblock:(void (^)(NSInteger))block{
    if (self = [super initWithFrame:frame]) {
        [self setUI:titleArray block:block];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
-(void)setUI:(NSArray *)array block:(void(^)(NSInteger index))block{
    lineView = [[UIView alloc]initWithFrame:CGRectMake(0, MYHEIGHT, self.frame.size.width/array.count, 2)];
    for (int i = 0; i<array.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*(self.frame.size.width/array.count), 0, self.frame.size.width/array.count, MYHEIGHT)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.tag =100+i;
        [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.block = block;
    }
}

-(void)btnClicked:(id)sender{
    UIButton *btn = sender;
    for (UIButton *button in [self subviews]) {
        if (btn == button) {
            button.backgroundColor = [UIColor lightGrayColor];
        }else{
            button.backgroundColor = [UIColor blackColor];
        }
    }
    if (self.block) {
        self.block(btn.tag - 100);
    }
    //动画效果
    
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView];
    [UIView animateWithDuration:0.5 animations:^{
        lineView.frame = CGRectMake(btn.frame.origin.x, MYHEIGHT, btn.frame.size.width, 2);
    } completion:^(BOOL finished) {
        
    }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
