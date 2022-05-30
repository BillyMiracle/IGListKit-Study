//
//  SearchCell.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "SearchCell.h"

@implementation SearchCell

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        [self.contentView addSubview:_searchBar];
    }
    return _searchBar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _searchBar.frame = self.contentView.bounds;
}

@end
