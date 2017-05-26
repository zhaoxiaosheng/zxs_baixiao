//
//  CarConfigurationTableViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/12/29.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarConfigurationTableViewController.h"
#import "CarConfigurationTableViewCell.h"
#import "CarConfiguration.h"
@interface CarConfigurationTableViewController ()
@property(strong,nonatomic)NSMutableArray *groupArray;//组名数组
@property(strong,nonatomic)NSMutableArray *dataArray;

@end

@implementation CarConfigurationTableViewController
-(NSMutableArray *)groupArray
{
    if (_groupArray == nil) {
        self.groupArray=[NSMutableArray array];
    }
    return _groupArray;
}
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CarConfigurationTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self makedata];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -------解析---------
-(void)makedata
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://baojia.qichecdn.com/priceapi3.9.16/services/speccompare/get?type=2&specids=%@&provinceid=110000&cityid=110100",self.carID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (data != nil) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSLog(@"%@",dic);
        for (NSDictionary *dict in dic[@"result"][@"paramitems"]) {
            CarConfiguration *model=[[CarConfiguration alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            NSString *group=model.itemtype;
            [self.groupArray addObject:group];
            NSMutableArray *tempArray=[NSMutableArray array];
            for (NSDictionary *dd in dict[@"items"]) {
                CarConfiguration *mm=[[CarConfiguration alloc]init];
                [mm setValuesForKeysWithDictionary:dd];
                [tempArray addObject:mm];
              
            }
           [self.dataArray addObject:tempArray];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        NSLog(@"%ld",self.dataArray.count);
        NSLog(@"%ld",self.groupArray.count);
    }
}];
    [task resume];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarConfigurationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CarConfiguration *model=self.dataArray[indexPath.section][indexPath.row];
    cell.titleLeabel.text=model.name;
    NSMutableArray *arr=[NSMutableArray array];
    for (NSDictionary *dic in model.modelexcessids) {
        CarConfiguration *mm=[[CarConfiguration alloc]init];
        [mm setValuesForKeysWithDictionary:dic];
        [arr addObject:mm];
    }
    CarConfiguration *m1=arr[0];
    CarConfiguration *m2=arr[1];
    cell.contentFirstLabel.text=m1.value;
    cell.contentSecondLabel.text=m2.value;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
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
