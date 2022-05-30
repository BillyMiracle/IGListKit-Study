//
//  ContentSectionController.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "IGListSectionController.h"
#import "ContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentSectionController : IGListSectionController

@property (nonatomic,assign) BOOL expanded;
@property (nonatomic, strong) ContentModel *model;

@end

NS_ASSUME_NONNULL_END
