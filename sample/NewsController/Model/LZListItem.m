//
//  LZListItem.m
//  sample
//
//  Created by LYCK on 2020/6/7.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "LZListItem.h"

@implementation LZListItem

#pragma mark - NSSecureCoding
- (nullable instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+(BOOL)supportsSecureCoding{
    return YES;
}

-(void)configWithDictionary:(NSDictionary *)dictionary{
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"picUrl"];
    self.uniqueKey = [dictionary objectForKey:@"uniqueKey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"authorName"];
    self.articleUrl = [dictionary objectForKey:@"articleUrl"];

}
@end
