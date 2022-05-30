//
//  AuthorSectionController.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "IGListSectionController.h"
#import "AuthorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorSectionController : IGListSectionController

@property (nonatomic, strong) AuthorModel *model;

@end

NS_ASSUME_NONNULL_END
