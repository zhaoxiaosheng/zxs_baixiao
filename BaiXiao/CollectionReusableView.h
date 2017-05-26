//
//  CollectionReusableView.h
//  BaiXiao
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 Z_小圣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView
{
    NSInteger  _currentIndex;
}
@property(nonatomic,retain)UIImageView *myView;
@property(nonatomic,retain)UIScrollView *scrollView;
@property(nonatomic,retain)UIPageControl *pageControl;
@property(nonatomic,retain)NSMutableArray *imageNameArray;

@property(nonatomic,retain)NSTimer *timer ;

@end
