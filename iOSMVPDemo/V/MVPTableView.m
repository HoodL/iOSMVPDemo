//
//  MVPTableView.m
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MVPTableView.h"
#import "MVPTableViewCell.h"
#import "Presenter.h"
static NSString *const reuserId = @"reuserId";

@interface MVPTableView() <UITableViewDataSource,UITableViewDelegate, PresenterProtocol>
@property(nonatomic, strong) Presenter *pt;
@end
@implementation MVPTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[MVPTableViewCell class] forCellReuseIdentifier:reuserId];
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

#pragma mark --UITableViewDataSource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pt.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    cell.delegate = self.pt;
    [cell setData:model cellForRowAtIndexPath:indexPath];
    return cell;
}
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.pt.dataArray.count > indexPath.row ? self.pt.dataArray[indexPath.row] : nil;
}

#pragma mark --PresenterProtocol
-(void)reloadUI {
    [self reloadData];
}

-(Presenter *)pt {
    if (!_pt) {
        _pt = [Presenter attachView:self];
        _pt.delegate = self;
    }
    return _pt;
}
@end
