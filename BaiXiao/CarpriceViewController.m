//
//  CarpriceViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarpriceViewController.h"
#import "CarpriceViewCell.h"
#import "HeadView.h"
#import "UrlHeader.h"
#import "CarpriceModel.h"
#import "UIImageView+WebCache.h"
#import "CarpriceDetailViewController.h"
@interface CarpriceViewController ()
@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)NSMutableArray *groupArray;
@end

@implementation CarpriceViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(NSMutableArray *)groupArray
{
    if (_groupArray == nil) {
        self.groupArray=[NSMutableArray array];
    }
    return _groupArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"汽车类";
    //头视图
    HeadView *headView=[[HeadView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 200)];
    self.tableView.tableHeaderView=headView;
    //隐藏ScorllView的滚动条
    headView.ScrollView.showsVerticalScrollIndicator = FALSE;
    headView.ScrollView.showsHorizontalScrollIndicator = FALSE;
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"北京" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightButtonAction:)];
    [self.tableView registerClass:[CarpriceViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self p_makeData];
    
}
-(void)rightButtonAction:(UIBarButtonItem *)sender
{
    

}
#pragma mark------数据--------------
-(void)p_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",kCarList]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
    
    for (NSDictionary  *dict in dic[@"result"][@"brandlist"]) {
        NSString *group=[dict objectForKey:@"letter"];
        [self.groupArray addObject:group];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict1 in dict[@"list"]) {
            CarpriceModel *car=[[CarpriceModel alloc]init];
            [car setValuesForKeysWithDictionary:dict1];
            [tempArray addObject:car];
        }
        [self.dataArray addObject:tempArray];
        
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}];
    [task resume]; 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}   


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarpriceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CarpriceModel *car=self.dataArray[indexPath.section][indexPath.row];
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:car.imgurl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.nameLabel.text=car.name;
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarpriceDetailViewController *carDetailVC=[[CarpriceDetailViewController alloc]initWithStyle:(UITableViewStylePlain)];
    CarpriceModel *car=self.dataArray[indexPath.section][indexPath.row];
    carDetailVC.detailID=car.brandid;
    carDetailVC.detailTitle=car.name;
    [self.navigationController showViewController:carDetailVC sender:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    return @[@"|",@"|",@"|",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"|",@"|",@"|"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *group=self.groupArray[section];
    return group;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
