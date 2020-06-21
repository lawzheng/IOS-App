//
//  LZListItem.h
//  sample
//
//  Created by LYCK on 2020/6/7.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 列表结构化数组
@interface LZListItem : NSObject<NSSecureCoding>

@property (nonatomic, copy, readwrite) NSString *category;
@property (nonatomic, copy, readwrite) NSString *picUrl;
@property (nonatomic, copy, readwrite) NSString *uniqueKey;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *date;
@property (nonatomic, copy, readwrite) NSString *authorName;
@property (nonatomic, copy, readwrite) NSString *articleUrl;

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
