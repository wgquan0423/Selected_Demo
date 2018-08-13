//
//  ViewController.m
//  Selected_Demo
//
//  Created by WuGuangQuan on 2018/7/27.
//  Copyright © 2018年 quan. All rights reserved.
//

#import "ViewController.h"
//#import "SingleViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * mtableView;
@property(nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray =[NSMutableArray array];
    self.view.backgroundColor =[UIColor whiteColor];
    [self dataSource];
    [self mtableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _dataArray[indexPath.row][@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary * dict =_dataArray[indexPath.row];
    Class typeVC = NSClassFromString(dict[@"viewController"]);
    UIViewController * viewController = [[typeVC alloc]init];
    viewController.title = dict[@"title"];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
-(UITableView *)mtableView
{
    if(!_mtableView)
    {
        _mtableView =[[UITableView alloc]initWithFrame:self.view.bounds];
        _mtableView.delegate = self;
        _mtableView.dataSource = self;
        _mtableView.tableFooterView =[[UIView alloc]init];
        [self.view addSubview:_mtableView];
    }
    return _mtableView;
}
-(void)dataSource
{
    
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"按钮单选",@"title",@"SingleSelectVC",@"viewController", nil];
    
     NSDictionary * dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"按钮多选",@"title",@"MultiSelectVC",@"viewController", nil];
    
    [self.dataArray addObject:dict1];
    [self.dataArray addObject:dict2];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
