//
//  AuthorModel.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AuthorModel : NSObject
<IGListDiffable>

@property (nonatomic, strong) NSNumber *authorId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *headImageUrl;
@property (nonatomic, strong) NSString *pos;

- (instancetype)initWithId:(NSNumber *)authorId name:(NSString *)name headImage:(NSString *)headImage;
@end

NS_ASSUME_NONNULL_END
