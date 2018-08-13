//
//  SingleSelectCell.h
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleSelectCell : UITableViewCell

@property(nonatomic,strong) UILabel * titleLabel;

@property(nonatomic,strong) UIButton * selectBtn;

@property(nonatomic,assign) BOOL isSelect;

//----------------------block用法1------------------------------
//@property(nonatomic,weak) void(^singleSelectBlock)(BOOL select, NSInteger btnTag);

//----------------------block用法2------------------------------
typedef void(^SingleSelectBlock)(BOOL select, NSInteger btnTag);
@property(nonatomic,copy) SingleSelectBlock selectBlock;

@end
