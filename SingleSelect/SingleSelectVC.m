//
//  SingleSelectVC.m
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import "SingleSelectVC.h"
#import "SingleSelectCell.h"
@interface SingleSelectVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * singleTabView;
@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic, assign) NSInteger btnTag;//默认选中的Tag
@end

@implementation SingleSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.btnTag = defaultTag+1; //self.btnTag = defaultTag+1  表示默认选择第二个，依次类推
    _dataArray =@[@"ApplePay",@"微信支付",@"支付宝支付",@"华为支付",@"小米支付",@"拉卡拉支付",@"银联支付"];
    
    [self singleTabView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    SingleSelectCell * selectCell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(selectCell==nil)
    {
        selectCell =[[SingleSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    selectCell.selectionStyle = UITableViewCellSelectionStyleNone;
    selectCell.titleLabel.text = _dataArray[indexPath.row];
    selectCell.selectBtn.tag = defaultTag + indexPath.row;
    if(selectCell.selectBtn.tag == self.btnTag)
    {
        selectCell.isSelect = YES;
        [selectCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
    }else
    {
        selectCell.isSelect = NO;
        [selectCell.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
    }
    
    
    __weak SingleSelectCell * weakCell = selectCell;
    
    //----------------------block用法1------------------------------
    /*
    [selectCell setSingleSelectBlock:^(BOOL select, NSInteger btnTag) {
        
        if(select)
        {
             [weakCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            [self.singleTabView reloadData];
            NSLog(@"点击==========%ld",(long)btnTag);
        }else
        {
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            [self.singleTabView reloadData];
            
            NSLog(@"$$$$$$%ld",(long)btnTag);
        }

    }];
    */
    //----------------------block用法2------------------------------
    selectCell.selectBlock = ^(BOOL select, NSInteger btnTag) {
        if(select)
        {
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            [self.singleTabView reloadData];
            NSLog(@"点击==========%ld",(long)btnTag);
        }else
        {
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            [self.singleTabView reloadData];
            
            NSLog(@"$$$$$$%ld",(long)btnTag);
        }
    };
    
    
    return selectCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选择了%ld行",(long)indexPath.row);
}
-(UITableView *)singleTabView
{
    if(!_singleTabView)
    {
        _singleTabView =[[UITableView alloc]initWithFrame:self.view.bounds];
        _singleTabView.delegate = self;
        _singleTabView.dataSource = self;
        _singleTabView.tableFooterView =[[UIView alloc]init];
        [self.view addSubview:_singleTabView];
    }
    return _singleTabView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
