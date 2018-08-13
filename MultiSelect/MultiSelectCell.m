//
//  MultiSelectCell.m
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import "MultiSelectCell.h"
#import "MultiSelectModel.h"
@implementation MultiSelectCell

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
    [_selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
    [self.contentView addSubview:_selectBtn];
    
}

-(void)setSelectModel:(MultiSelectModel *)selectModel
{
    _selectModel = selectModel;
    self.titleLabel.text = selectModel.titleName;
    if(selectModel.isSelect)
    {
         [self.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
    }else
    {
         [self.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
