//
//  Presenter.m
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "Presenter.h"
#import "UserInfoModel.h"
#import "PresenterProtocol.h"
#import <YYKit.h>

@interface Presenter()

@end
@implementation Presenter
/**
 初始化函数
 */
- (instancetype)initWithView:(id)view{

    if (self = [super init]) {
        _view = view;
        [self loadData];
    }
    return self;
}
/**
 * 绑定视图
 * @param view 要绑定的视图
 */
+ (instancetype) attachView:(id)view {
    return [[Presenter alloc] initWithView:view];
}


- (void)loadData{
    
    NSArray *temArray =
    @[
      @{@"name":@"Gabrielle",@"imageUrl":@"http://Gabrielle",@"num":@"25"},
      @{@"name":@"James",@"imageUrl":@"http://James",@"num":@"39"},
      @{@"name":@"Nicholas",@"imageUrl":@"http://Nicholas",@"num":@"49"},
      @{@"name":@"Cassiel",@"imageUrl":@"http://Cassiel",@"num":@"7"},
      @{@"name":@"Brandon",@"imageUrl":@"http://Brandon",@"num":@"16"},
      @{@"name":@"Dean",@"imageUrl":@"http://Dean ",@"num":@"6"},
      @{@"name":@"Lucien",@"imageUrl":@"http://Lucien",@"num":@"42"},
      @{@"name":@"Howell",@"imageUrl":@"http://Howell",@"num":@"30"},
      @{@"name":@"Michelle",@"imageUrl":@"http://Michelle",@"num":@"11"},
      @{@"name":@"Quella",@"imageUrl":@"http://Quella",@"num":@"51"},
      @{@"name":@"Ulrica",@"imageUrl":@"http://Ulrica ",@"num":@"61"},
      @{@"name":@"Indira",@"imageUrl":@"http://Indira ",@"num":@"99"},
    ];
    for (int i = 0; i<temArray.count; i++) {
        UserInfoModel *model = [UserInfoModel modelWithDictionary:temArray[i]];
        [self.dataArray addObject:model];
    }
}
-(void)didClickAddBtnWithNum:(int)num indexPath:(NSIndexPath *)indexPath {
    @synchronized (self) {
        if (indexPath.row < self.dataArray.count) {
            UserInfoModel *model = self.dataArray[indexPath.row];
            model.num = [NSString stringWithFormat:@"%d",num];
        }
    }
}
-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}
/**
 解绑视图
 */
- (void)detachView{
    _view = nil;
}

@end
