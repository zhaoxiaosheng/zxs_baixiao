//
//  QuotationTableViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/11.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "QuotationTableViewController.h"
#import "QuotationListCell.h"
#import "QuotationList.h"
#import "UrlHeader.h"
#import "UIImageView+WebCache.h"
#import "QuotationDetailViewController.h"
@interface QuotationTableViewController ()
@property(strong,nonatomic)NSMutableArray *hotDataArray;
@property(strong,nonatomic)NSMutableArray *sortDataArray;
@property(strong,nonatomic)NSMutableArray *allDataArray;


@end

@implementation QuotationTableViewController
-(NSMutableArray *)hotDataArray
{
    if (_hotDataArray == nil) {
        self.hotDataArray=[NSMutableArray array];
    }
    return _hotDataArray;
}
-(NSMutableArray *)sortDataArray
{
    if (_sortDataArray == nil) {
        self.sortDataArray=[NSMutableArray array];
    }
    return _sortDataArray;
}
-(NSMutableArray *)allDataArray
{
    if (_allDataArray == nil) {
        self.allDataArray=[NSMutableArray array];
    }
    return _allDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.rootTitle;
    [self.tableView registerClass:[QuotationListCell class] forCellReuseIdentifier:@"cell"];
    [self setupDatas];
    
}
-(void)setupDatas
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&noParam=1&vs=and410",kQuotationUrl,self.rootID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
   // NSLog(@"%@",data);
    for (NSDictionary *dict in dic[@"rank"]) {
        QuotationList *qq=[[QuotationList alloc]init];
        
        [qq setValuesForKeysWithDictionary:dict];
        
        [self.hotDataArray addObject:qq];
       // NSLog(@"==%@",qq.Id);
    }
    [self.allDataArray addObject:self.hotDataArray];
   // NSLog(@"*******%ld",self.hotDataArray.count);

    
    NSDictionary *dict1 = dic[@"abc"];
//    NSLog(@"%@",dict1);
   
    NSMutableArray * arr_1 = [NSMutableArray array];
    
    for (NSString * key in dict1) {
        
        NSArray * arr = dict1[key];
        
        [arr_1 addObject:arr];
    }
//    NSLog(@"%ld",arr_1.count);
    
    for (NSArray * arr in arr_1) {
        
        for (NSDictionary * dict2 in arr) {
            QuotationList *qq=[[QuotationList alloc]init];
            
            [qq setValuesForKeysWithDictionary:dict2];
            
            [self.sortDataArray addObject:qq];
           // NSLog(@"%@",qq.Id);
        }
        
    }
   // NSLog(@"%ld",self.sortDataArray.count);
    [self.allDataArray addObject:self.sortDataArray];
   
    
//    NSLog(@"%ld",self.allDataArray.count);
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
    return self.allDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allDataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuotationListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    QuotationList *qq=self.allDataArray[indexPath.section][indexPath.row];
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:qq.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.namelabel.text=qq.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuotationDetailViewController *qutationDVC=[[QuotationDetailViewController alloc]initWithStyle:(UITableViewStylePlain)];
    QuotationList *qq=self.allDataArray[indexPath.section][indexPath.row];
    qutationDVC.qID=qq.Id;
    qutationDVC.qname=qq.name;
    qutationDVC.rootID=self.rootID;
    [self.navigationController showViewController:qutationDVC sender:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"热门品牌";
    }else{
        return @"正品专区";
    }
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
