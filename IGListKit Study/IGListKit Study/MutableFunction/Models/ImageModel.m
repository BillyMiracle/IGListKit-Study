//
//  ImageModel.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "ImageModel.h"

@implementation ImageModel

- (instancetype)initWithUrls:(NSArray *)urls {
    if (self = [super init]) {
        if (urls) {
            self.imageUrls = [urls mutableCopy];
        } else {
            self.imageUrls = [NSMutableArray array];

        }
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return _imageUrls;
}

- (BOOL)isEqualToDiffableObject:(nullable ImageModel *)object {
    return _imageUrls == object.imageUrls;
}

@end
