//
//  ContentSectionController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/27.
//

#import "ContentSectionController.h"
#import "ContentCell.h"

@interface ContentSectionController()<Fold>

@end

@implementation ContentSectionController

- (NSInteger)numberOfItems {
    //相当于UITableView一个indexPath.setion中有几个row
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    //返回cell大小
    CGFloat width = [self.collectionContext containerSize].width;
//    CGFloat height = _expanded ? [ContentCell textHeight:_model.content ? :@"" width:width] : ContentCell.singleLineHeight;
    CGFloat height = _expanded ? [ContentCell textHeight:_model.content ? _model.content : @"" width:width] : [ContentCell lineHeight:_model.content width:width];
    if ([ContentCell shouldFold:_model.content width:width]) {
        height += 40;
    }
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    //返回cell
    ContentCell *cell = [self.collectionContext dequeueReusableCellOfClass:[ContentCell class] forSectionController:self atIndex:index];
    cell.label.numberOfLines = _expanded ? 0 : 4;
    cell.label.text = _model.content;
    cell.index = index;
    cell.delegate = self;
    if (cell.foldButton) {
        if (!_expanded) {
            [cell.foldButton setTitle:@"展开" forState:UIControlStateNormal];
        } else {
            [cell.foldButton setTitle:@"收起" forState:UIControlStateNormal];
        }
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    //绑定model
    _model = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    //一个row的点击事件
//    _expanded = !_expanded;
//    [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
//        [batchContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:0]];
//    } completion:nil];
//    return;
}

- (void)fold {
    _expanded = !_expanded;
    [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadInSectionController:self atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } completion:nil];
}

@end
