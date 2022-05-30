//
//  LabelSectionController.m
//  IGListKit Study
//
//  Created by 张博添 on 2022/5/26.
//

#import "LabelSectionController.h"
#import "LabelCell.h"
@implementation LabelSectionController

// MARK: IGListSectionType
- (NSInteger)numberOfItems {
    //相当于UITableView一个indexPath.setion中有几个row
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    //返回cell大小
    return CGSizeMake([self.collectionContext containerSize].width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    //返回cell
    LabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.text = _object;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    //绑定model
    //每个数据处理
    _object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    //一个row的点击事件
    return;
}

@end
