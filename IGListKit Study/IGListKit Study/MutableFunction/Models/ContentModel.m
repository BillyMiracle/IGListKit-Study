//
//  ContentModel.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "ContentModel.h"

@implementation ContentModel

- (instancetype)initWithContent:(NSString *)content {
    if (self = [super init]) {
        self.content = content;
    }
    return self;
}
- (nonnull id<NSObject>)diffIdentifier {
    return _content;
}

- (BOOL)isEqualToDiffableObject:(nullable ContentModel *)object {
    return [_content isEqualToString:object.content];
}

@end
