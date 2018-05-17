//
//  ViewController.m
//  Announcement
//
//  Created by 钱飞英 on 2018/4/25.
//  Copyright © 2018年 钱飞英. All rights reserved.
//

#import "ViewController.h"
#import "GYRollingNoticeView.h"
#import "GYNoticeViewCell.h"
@interface ViewController ()<GYRollingNoticeViewDataSource>
@property (nonatomic, copy) NSArray *arr1;
@property (nonatomic, strong) GYRollingNoticeView *noticeView1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.arr1 = @[@"小米千元全面屏：抱歉，久等！625献上",
              @"可怜狗狗被抛弃，苦苦等候主人半年",
              @"三星中端新机改名，全面屏火力全开",
              @"学会这些，这5种花不用去花店买了",
              @"华为nova2S发布，剧透了荣耀10？"
              ];
    
     [self creatRollingViewWithArray:self.arr1];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.noticeView1 stopRoll];
}


- (void)creatRollingViewWithArray:(NSArray *)arr
{
    self.noticeView1 = [[GYRollingNoticeView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30)];
    self.noticeView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.noticeView1];
    self.noticeView1.dataSource = self;
    [self.noticeView1 registerClass:[GYNoticeViewCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
    self.noticeView1.stayInterval = 3;
    [self.noticeView1 reloadDataAndStartRoll];
}

#pragma mark - GYRollingNoticeViewDataSource
-(NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    return self.arr1.count;
}

-(GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    GYNoticeViewCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"GYNoticeViewCell"];
    cell.textLabel.text = self.arr1[index];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
