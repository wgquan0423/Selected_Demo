//
//  MultiSelectVC.m
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import "MultiSelectVC.h"
#import "MultiSelectCell.h"
#import "MultiSelectModel.h"
@interface MultiSelectVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * multiTabView;
@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic,strong) NSMutableArray * dataSource;

@end

@implementation MultiSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    _dataSource =[[NSMutableArray alloc]init];
    
    _dataArray =@[@"ApplePay",@"微信支付",@"支付宝支付",@"华为支付",@"小米支付",@"拉卡拉支付",@"银联支付"];
    [self multiTabView];
    
    for(int i=0;i<_dataArray.count;i++)
    {
        MultiSelectModel * selectModel =[[MultiSelectModel alloc]init];
        selectModel.isSelect = NO;
        selectModel.titleName = _dataArray[i];
        [_dataSource addObject:selectModel];
        
    }
    [self.multiTabView reloadData];
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    MultiSelectCell * multiSelectCell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(multiSelectCell==nil)
    {
        multiSelectCell =[[MultiSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    multiSelectCell.selectionStyle = UITableViewCellSelectionStyleNone;
    multiSelectCell.selectModel = _dataSource[indexPath.row];
    
    //    //如果是只点击选中按钮选择的话
    multiSelectCell.selectBtn.tag  = indexPath.row;
    [multiSelectCell.selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return multiSelectCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选择了%ld行",(long)indexPath.row);
    
//    MultiSelectModel * selectModel = _dataSource[indexPath.row];
//    selectModel.isSelect = !selectModel.isSelect;
//    [self.multiTabView reloadData];
    
}
- (void)selectBtnAction:(UIButton *)btn{

    MultiSelectModel * selectModel = self.dataSource[btn.tag];
    selectModel.isSelect = !selectModel.isSelect;
    [self.multiTabView reloadData];

}
-(UITableView *)multiTabView
{
    if(!_multiTabView)
    {
        _multiTabView =[[UITableView alloc]initWithFrame:self.view.bounds];
        _multiTabView.delegate = self;
        _multiTabView.dataSource = self;
        _multiTabView.tableFooterView =[[UIView alloc]init];
        [self.view addSubview:_multiTabView];
    }
    return _multiTabView;
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
