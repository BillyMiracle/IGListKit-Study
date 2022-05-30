//
//  SearchSectionController.h
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SearchSectionController;
@protocol SearchSectionControllerDelegate <NSObject>

- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text;

@end

@interface SearchSectionController : IGListSectionController
<UISearchBarDelegate, IGListScrollDelegate>

@property (weak, nonatomic) id<SearchSectionControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
