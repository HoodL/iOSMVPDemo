//
//  PresenterProtocol.h
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/23.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PresenterProtocol <NSObject>

@required

@optional
//UI层传递信息给Model层
-(void)didClickAddBtnWithNum:(int)num indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
