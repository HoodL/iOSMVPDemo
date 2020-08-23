//
//  ViewController.m
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "ViewController.h"
#import "MVPTableView.h"

@interface ViewController ()
@property (nonatomic, strong) MVPTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

-(MVPTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MVPTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}
@end
