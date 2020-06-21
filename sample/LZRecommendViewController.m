//
//  LZRecommendViewController.m
//  sample
//
//  Created by LYCK on 2020/5/30.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZRecommendViewController.h"

@interface LZRecommendViewController ()<UIScrollViewDelegate>

@end

@implementation LZRecommendViewController

// 重写初始化函数
- (instancetype) init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    // 控制横向滚动条
//    scrollView.showsHorizontalScrollIndicator = NO;
    // 翻页效果
    NSArray *colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor lightGrayColor], [UIColor grayColor]];
    for (int i = 0; i<5;i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            
            // 使用imageAssest 放置图片
            UIImage *image2x = [UIImage imageNamed:@"testScale"];
            
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                // 增加事件监听
                UITapGestureRecognizer *tapGusture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
                [view addGestureRecognizer:tapGusture];
                view;
            })];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

- (void)viewClick{
    NSLog(@"x");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // any offset changes
//    NSLog(@"scrolling-%@", @(scrollView.contentOffset.y));
}
// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{}   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{}     // called when scroll view grinds to a halt

@end
