//
//  LZTableViewCell.m
//  sample
//
//  Created by LYCK on 2020/5/30.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZTableViewCell.h"
#import "LZListItem.h"
#import "LZScreen.h"
//#import "SDWebImageManager.h"

@interface LZTableViewCell ()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end


@implementation LZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 300, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:UI(12)];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(100, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:UI(12)];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(150, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:UI(12)];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:UIRect(330, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            // 图片显示方式
            self.rightImageView.contentMode = UIViewContentModeScaleToFill;
            self.rightImageView;
        })];
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:UIRect(290, 80, 30, 20)];
            // 根据状态切换视图
            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];
            // 监听事件
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            
            // 圆角
            self.deleteButton.layer.cornerRadius = UI(10);
            self.deleteButton.layer.masksToBounds = YES;
            // 边框
            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteButton.layer.borderWidth = UI(2);
            
            self.deleteButton;
        })];

        
    }
    return self;

    
}

#pragma mark - 分割
- (void) layoutTableViewCellWithItem:(LZListItem *)item {
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + UI(15), self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);

    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + UI(15), self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    // 开个线程去加载耗时任务
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    // gcd 系统帮助管理线程
    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
    });
    
//    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] complete:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageUrl) {
//        NSLog(@"");
//    }];
    
    
//    self.rightImageView.image = [UIImage imageNamed:@"icon.buldel/xx.png"];
}

- (void) deleteButtonClick{
    NSLog(@"delete");

    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
