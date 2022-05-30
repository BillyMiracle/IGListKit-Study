//
//  SearchSectionController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "SearchSectionController.h"
#import "SearchCell.h"

@implementation SearchSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDelegate = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake([self.collectionContext containerSize].width, 44);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SearchCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SearchCell class] forSectionController:self atIndex:index];
    if (cell) {
        cell.searchBar.delegate = self;
    }
    return cell;
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDraggingSectionController:(IGListSectionController *)sectionController willDecelerate:(BOOL)decelerate {}

- (void)listAdapter:(IGListAdapter *)listAdapter didScrollSectionController:(IGListSectionController *)sectionController {
    SearchCell *searchCell = [self.collectionContext cellForItemAtIndex:0 sectionController:self];
    if (searchCell) {
        searchCell.searchBar.text = @"";
        [searchCell.searchBar resignFirstResponder];
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter willBeginDraggingSectionController:(IGListSectionController *)sectionController {}

// MARK: UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.delegate searchSectionController:self didChangeText:searchText];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.delegate searchSectionController:self didChangeText:@""];
}



@end
