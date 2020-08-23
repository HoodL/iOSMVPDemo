//
//  MVPTableViewCell.h
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"
#import "PresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface MVPTableViewCell : UITableViewCell
@property (nonatomic, weak) id<PresenterProtocol> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

-(void)setData:(UserInfoModel*)model cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
