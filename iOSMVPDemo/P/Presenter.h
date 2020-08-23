//
//  Presenter.h
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresenterProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Presenter<T> : NSObject<PresenterProtocol> {
    __weak T _view;
}

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id<PresenterProtocol> delegate;
/**
 * 绑定视图
 * @param view 要绑定的视图
 */
+ (instancetype) attachView:(T)view ;

/**
 解绑视图
 */
- (void)detachView;

@end

NS_ASSUME_NONNULL_END
