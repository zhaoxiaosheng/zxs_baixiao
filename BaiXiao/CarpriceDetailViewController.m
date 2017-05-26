//
//  CarpriceDetailViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/14.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarpriceDetailViewController.h"
#import "CarpriceDetailModel.h"
#import "CarpriceDetailViewCell.h"
#import "UrlHeader.h"
#import "UIImageView+WebCache.h"
#import "CarDetailViewController.h"

@interface CarpriceDetailViewController ()
@property(strong,nonatomic)NSMutableArray *dataArray;
@end

@implementation CarpriceDetailViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.detailTitle;
    [self.tableView registerClass:[CarpriceDetailViewCell class] forCellReuseIdentifier:@"cell"];
    [self p_makeData];
}
-(void)p_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&salestate=1&cityid=110100",kCarDetailUrl,self.detailID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
   
    for (NSDictionary *dict in dic[@"result"][@"fctlist"]) {
            for (NSDictionary *dd in dict[@"serieslist"]) {
                CarpriceDetailModel *car=[[CarpriceDetailModel alloc]init];
                [car setValuesForKeysWithDictionary:dd];
                [self.dataArray addObject:car];
        
            }
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarpriceDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CarpriceDetailModel *car=self.dataArray[indexPath.row];
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",car.imgurl]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.nameLabel.text=car.name;
    cell.levelnameLabel.text=[NSString stringWithFormat:@"车型：%@",car.levelname];
    cell.priceLabel.text=[NSString stringWithFormat:@"￥%@",car.price];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarDetailViewController *carDVC=[[CarDetailViewController alloc]init];
    CarpriceDetailModel *car=self.dataArray[indexPath.row];
    carDVC.carID =car.id;
    carDVC.carname=car.name;
    [self.navigationController showViewController:carDVC sender:nil];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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
