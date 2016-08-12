//
//  ChocolateSegmentedControl.h
//  UISegmentedControl_iOS
//
//  Created by Mac on 16/3/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^btnClickBlock)(NSInteger index);
@interface ChocolateSegmentedControl : UIView

@property(nonatomic,assign)btnClickBlock block;

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray backblock:(void (^)(NSInteger))block;
@end
