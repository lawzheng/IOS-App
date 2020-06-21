//
//  ViewController.m
//  sample
//
//  Created by LYCK on 2020/5/23.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "ViewController.h"
#import "LZTableViewCell.h"
#import "LZMediator.h"
#import "LZDeleteCellView.h"
#import "LZListLoader.h"
#import "LZListItem.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, LZTabViewCellDelegate>


// 相当于vue中data 加下划线使用
@property(nonatomic, strong, readwrite) UITableView *tabView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) LZListLoader *listLoader;

@end

@implementation ViewController

// 拓展初始化方法
-(instancetype)init {
    self = [super init];
    if (self) {
//        _dataArray = @[].mutableCopy;
//        for (int i=0; i<20; i++) {
//            [_dataArray addObject:@(i)];
//        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIView *view2 = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:view2];

// 点击事件
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view2 addGestureRecognizer:tapGesture];
    
    // 列表
    _tabView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    [self.view addSubview:_tabView];
    self.listLoader = [[LZListLoader alloc] init];
    
    __weak typeof(self) wSelf = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<LZListItem *> * _Nonnull dataArray) {
        __strong typeof(wSelf) strongSelf = wSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.tabView reloadData];
        
        NSLog(@"");
    }];
}

// 点击事件
//- (void)pushController{
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    viewController.navigationItem.title = @"标题";
//
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:nil];
//    [self.navigationController pushViewController:viewController animated:YES];
//}

// 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

// 给每个cell赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    // 只渲染一个屏幕的数量 类似虚拟滚动
    if (!cell) {
        cell = [[LZTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
//    cell.textLabel.text = [NSString stringWithFormat: @"主标题-%@", @(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"iconzzz"];
    return cell;
}

// 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LZListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    // 解藕
    __kindof UIViewController *detailController = [LZMediator detailViewControllerWithUrl:item.articleUrl];
    
    detailController.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    // 跳页面
    [self.navigationController pushViewController:detailController animated:YES];
}


- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
//    NSLog(@"1");
//    LZDeleteCellView *deleteView = [[LZDeleteCellView alloc] initWithFrame:self.view.bounds];
//
//    // 获取删除按钮位置
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
//    // 删除
//    __weak typeof(self) wSelf = self;
//    [deleteView showDeleteViewFromPoint:(CGPoint)rect.origin clickBlock:^{
//        // 回调
//        __strong typeof(wSelf) strongSelf = wSelf;
//        [strongSelf.dataArray removeLastObject];
//        [self.tabView deleteRowsAtIndexPaths:@[[strongSelf.tabView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
