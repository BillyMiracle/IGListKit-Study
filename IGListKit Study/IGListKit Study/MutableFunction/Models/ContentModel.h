//
//  ContentModel.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentModel : NSObject
<IGListDiffable>

@property (nonatomic, strong) NSString *content;
- (instancetype)initWithContent:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
