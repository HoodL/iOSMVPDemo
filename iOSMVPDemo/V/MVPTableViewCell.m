//
//  MVPTableViewCell.m
//  iOSMVPDemo
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MVPTableViewCell.h"
#import <Masonry.h>

@interface MVPTableViewCell()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) int num;

@end

@implementation MVPTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.addBtn.mas_left);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.numLabel.mas_left);
        make.size.centerY.equalTo(self.addBtn);
        
    }];
    
}

-(void)initSubViews {
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"Cooci";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    self.nameLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.subBtn];
    [self.subBtn setTitle:@" - " forState:UIControlStateNormal];
    [self.subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.subBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.subBtn setBackgroundColor:[UIColor blueColor]];
    [self.subBtn addTarget:self action:@selector(didClickSubBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.subBtn.layer.cornerRadius = 15;
    self.subBtn.layer.masksToBounds = YES;
    self.subBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    
    self.numLabel = [[UILabel alloc] init];
    self.numLabel.text = @"0";
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.font = [UIFont systemFontOfSize:20];
    self.numLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:self.numLabel];
    
    
    
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.addBtn];
    [self.addBtn setTitle:@" + " forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.addBtn setBackgroundColor:[UIColor blueColor]];
    [self.addBtn addTarget:self action:@selector(didClickAddBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.addBtn.layer.cornerRadius = 15;
    self.addBtn.layer.masksToBounds = YES;
    self.addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    self.num = 0;
}

#pragma mark - Action

- (void)didClickSubBtn:(UIButton *)sender{
    int now = [self.numLabel.text intValue];
    if (now <= 0) {return;}
    self.num = now;
    self.num--;
}

- (void)didClickAddBtn:(UIButton *)sender{
    int now = [self.numLabel.text intValue];
    if (now >= 100) {return;}
    self.num = now;
    self.num++;
}

#pragma mark - num setter

//在这里需要更新Model层数据, 通过中介presenter来把数据变化信息传递给Model层
-(void)setNum:(int)num {
    _num = num;
    self.numLabel.text = [NSString stringWithFormat:@"%d",num];
    if ((self.delegate) && [self.delegate respondsToSelector:@selector(didClickAddBtnWithNum:indexPath:)]) {
        [self.delegate didClickAddBtnWithNum:num indexPath:self.indexPath];
    }
}

-(void)setData:(UserInfoModel *)model cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    self.nameLabel.text = model.name;
    self.numLabel.text = model.num;
    self.indexPath = indexPath;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
