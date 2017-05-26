//
//  CarVideoListViewController.m
//  BaiXiao
//
//  Created by Z_小圣 on 15/11/16.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import "CarVideoListViewController.h"
#import "CarVideoListViewCell.h"
#import "UrlHeader.h"
#import "CarVideoListModel.h"
#import "CarVideoListHeaderView.h"
#import "UIImageView+WebCache.h"
#import "CarVideoDetailWebViewController.h"
@interface CarVideoListViewController ()
@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)CarVideoListHeaderView *headView;
@end

@implementation CarVideoListViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        self.dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self z_makeData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.carName;
    //头视图
    self.headView=[[CarVideoListHeaderView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 230)];
    self.tableView.tableHeaderView=self.headView;
    
    //开交互
    self.headView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myImageViewAction)];
    [self.headView addGestureRecognizer:singleTap];
    
    
    
    [self.tableView registerClass:[CarVideoListViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}
#pragma mark---------------数据---------------
-(void)z_makeData
{
NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@-p1-s20.html",kCarVideoUrl,self.carID]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (data !=nil) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
        for (NSDictionary *dict in dic[@"result"][@"list"]) {
            CarVideoListModel *model=[[CarVideoListModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [self.dataArray addObject:model];
            NSLog(@"%@",model.videoid);
        }
        if (self.dataArray.count != 0) {
            [self z_headData];
        }else{
            UIAlertController *alt=[UIAlertController alertControllerWithTitle:@"提示" message:@"没有相关视频" preferredStyle:(UIAlertControllerStyleAlert)];
            [self presentViewController:alt animated:YES completion:nil];
            UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alt addAction:okAction];
            
        }
        

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
    
}];
    [task resume];

}
#pragma mark---------头视图数据-------------
-(void)z_headData
{
    CarVideoListModel *model=self.dataArray[0];
    [self.headView.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.largepic]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.headView.nameLabel.text=[NSString stringWithFormat:@"%@",model.title];

}
#pragma mark-------------头视图点击---------------
-(void)myImageViewAction
{
    CarVideoDetailWebViewController *webVC=[[CarVideoDetailWebViewController alloc]init];
    CarVideoListModel *model=self.dataArray[0];
    webVC.videoID=model.videoid;
    [self.navigationController showViewController:webVC sender:nil];

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
    CarVideoListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    CarVideoListModel *model=self.dataArray[indexPath.row];
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:model.smallpic] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cell.titleLabel.text=[NSString stringWithFormat:@"%@",model.title];
    cell.typeLabel.text=[NSString stringWithFormat:@" %@",model.type];
    cell.playcount.text=[NSString stringWithFormat:@"%@",model.playcount];
    cell.playImageView.image=[UIImage imageNamed:@"12-eye"];
    if ([model.type isEqualToString:@"花边"]) {
        cell.typeLabel.backgroundColor=[UIColor colorWithRed:0.98 green:0.87 blue:0.19 alpha:1];
    }else if([model.type isEqualToString:@"试车"])
    {
        cell.typeLabel.backgroundColor=[UIColor colorWithRed:0.9 green:0.7 blue:0.2 alpha:1];
    }else if([model.type isEqualToString:@"新车"])
    {
        cell.typeLabel.backgroundColor=[UIColor colorWithRed:0.9 green:0.4 blue:0.14 alpha:1];
    }else if([model.type isEqualToString:@"广告"])
    {
        cell.typeLabel.backgroundColor=[UIColor colorWithRed:0.15 green:0.76 blue:0.29 alpha:1];
    
    }
        
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarVideoDetailWebViewController *webVC=[[CarVideoDetailWebViewController alloc]init];
    CarVideoListModel *model=self.dataArray[indexPath.row];
    webVC.videoID=model.videoid;
    [self.navigationController showViewController:webVC sender:nil];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
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
