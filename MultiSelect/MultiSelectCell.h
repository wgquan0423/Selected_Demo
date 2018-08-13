//
//  MultiSelectCell.h
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultiSelectModel;

@interface MultiSelectCell : UITableViewCell

@property(nonatomic,strong) UILabel * titleLabel;

@property(nonatomic,strong) UIButton * selectBtn;

@property(nonatomic,strong) MultiSelectModel * selectModel;

@end
