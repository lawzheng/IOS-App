//
//  LZVideoViewController.m
//  sample
//
//  Created by LYCK on 2020/5/30.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZVideoViewController.h"
#import "LZVideoCoverView.h"

@interface LZVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation LZVideoViewController

- (instancetype) init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[LZVideoCoverView class] forCellWithReuseIdentifier:@"LZVideoCoverView"];
    
    [self.view addSubview:collectionView];
}

// 自定义item样式
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, 300);
//    if (indexPath.item %3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LZVideoCoverView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    if ([cell isKindOfClass:[LZVideoCoverView class]]) {
        [((LZVideoCoverView* )cell) layoutWithVideoCoverUrl:@"icon.bundle/b2263121ad080952.png" videoUrl:@"https://photo.greenplayer.cn/h5/2020/05/11/1589166656382.mov"];
    }
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
