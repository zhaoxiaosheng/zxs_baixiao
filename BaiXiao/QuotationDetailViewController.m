//
//  QuotationDetailViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/12.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "QuotationDetailViewController.h"
#import "QutationDetailViewCell.h"
#import "UrlHeader.h"
#import "Quotation.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"
@interface QuotationDetailViewController ()
@property(strong,nonatomic)NSMutableArray *dataArray;
@end

@implementation QuotationDetailViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.qname;
    [self.tableView registerClass:[QutationDetailViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self p_makeData];
    
}
-(void)p_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&manuId=%@&orderBy=1&page=1&locationId=1",kDetailUrl,self.rootID,self.qID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (data != nil) {
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
    
        for (NSDictionary *dict in dic[@"data"]) {
            Quotation *q=[[Quotation alloc]init];
            [q setValuesForKeysWithDictionary:dict];
            
            [self.dataArray addObject:q];
            
        }
        
dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
});
        
    }
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
    QutationDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Quotation *q=self.dataArray[indexPath.row];
    cell.nameLabel.text=q.name;
    [cell.MyImageView sd_setImageWithURL:[NSURL URLWithString:q.pic] placeholderImage:[UIImage imageNamed:@"1"]];
    cell.priceLabel.text=[NSString stringWithFormat:@"%@%@",q.mark,q.price];
    cell.reviewLabel.text=[NSString stringWithFormat:@"评价：%@",q.reviewNum];
                  
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC=[[DetailViewController alloc]init];
    Quotation *q=self.dataArray[indexPath.row];
    detailVC.webID=q.id;
    detailVC.name=q.name;
    [self.navigationController showViewController:detailVC sender:nil];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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
