//
//  SingleSelectCell.m
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import "SingleSelectCell.h"

@implementation SingleSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self createUI];
    
    }
    
    return self;
}
-(void)createUI
{
    _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(15,0,150, cellHeight)];
    _titleLabel.textColor =RGBColor(120, 120, 120);
    //_titleLabel.backgroundColor =[UIColor yellowColor];
    _titleLabel.font =[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_titleLabel];
    
    _selectBtn =[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-50, 13, 20, 20)];
   // _selectBtn.backgroundColor =[UIColor redColor];
    [_selectBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectBtn];
}
-(void)selectBtnClicked:(UIButton *)button
{
    self.isSelect = !self.isSelect;
    //----------------------block用法1------------------------------
//    if(self.singleSelectBlock)
//    {
//        self.singleSelectBlock(self.isSelect,button.tag);
//    }
    //----------------------block用法2------------------------------
    
    if(self.selectBlock)
    {
        self.selectBlock(self.isSelect, button.tag);
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
