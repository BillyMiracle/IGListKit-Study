//
//  AuthorModel.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "AuthorModel.h"

@implementation AuthorModel

- (instancetype)initWithId:(NSNumber *)authorId name:(NSString *)name headImage:(NSString *)headImage {
    if (self = [super init]) {
        self.authorId = authorId;
        self.name = name;
        self.headImageUrl = headImage;
        self.pos = [self uuid];
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return self.pos;
}

- (NSString *)uuid {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
//    NSLog(@"%@", uuid);
    return [uuid lowercaseString];
}


- (BOOL)isEqualToDiffableObject:(AuthorModel *)object {
    if (self == object) {//指针地址比较
        return YES;
    }
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
//    return _authorId.intValue == object.authorId.intValue;
//    return NO;
    return [self.pos isEqualToString:object.pos];
}

@end
