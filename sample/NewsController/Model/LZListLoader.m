//
//  LZListLoader.m
//  sample
//
//  Created by LYCK on 2020/5/31.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZListLoader.h"
#import <AFNetworking.h>
#import "LZListItem.h"

@implementation LZListLoader


- (void)loadListDataWithFinishBlock:(LZListLoaderFinishBlock)finishBlock{
    NSString *urlString = @"http://rap2.taobao.org:38080/app/mock/243469/list";
    NSURL *listUrl = [NSURL URLWithString:urlString];
//    po listUrl.path .scheme

    __unused NSURLRequest *listRequset = [NSURLRequest requestWithURL:listUrl];

    NSURLSession *session = [NSURLSession sharedSession];

    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning 类型的检查
        NSArray *dataArray = (NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            LZListItem *listItem = [[LZListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        [weakSelf _archiveListDataWithArray:listItemArray.copy];
        
        // 放到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });

    }];
    
    [dataTask resume];
    
//    [[AFHTTPSessionManager manager] GET:@"https://www.toutiao.com/api/pc/feed/?min_behot_time=0&category=__all__&utm_source=toutiao&widen=1&tadrequire=true&as=A1E58E2DF3B767C&cp=5ED3B7A6373CDE1&_signature=HnhDxAAgEBD0-Rqiwkj6CR55QtAAECvX2C7ARHSJwYUJcJ2ZaqL.0DPEd03nUlMXHD2TuKLPrZLgicnzCHgIyxLvAK0ewf2XxbCwppt1xqjprraLK29nO4itDGy73ovqTZf" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
}

// 获取沙盒地址
-(void)_archiveListDataWithArray:(NSArray<LZListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    // 创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"LZData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    // 创建文件
    NSString *listDatePath = [dataPath stringByAppendingPathComponent:@"list"];
    // 设置二进制序列化
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
//    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:listDatePath contents:listData attributes:nil];
    
    // 读二进制文件
//    NSData *readListData = [fileManager contentsAtPath:listDatePath];
    
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[LZListItem class], nil] fromData:readListData error:nil];
    
    // key value 存储
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//
//    NSData *test = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[LZListItem class], nil] fromData:test error:nil];
    
    // 查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDatePath];
    
    // 删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDatePath error:nil];
//    }
    
    // 追加操作
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDatePath];
    
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    
    NSLog(@"");
}

@end
