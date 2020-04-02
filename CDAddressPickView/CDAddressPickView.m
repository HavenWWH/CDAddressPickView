//
//  CDAddressPickView.m
//  FT_iPhone
//
//  Created by 吴文海 on 2019/11/29.
//  Copyright © 2019 ChangDao. All rights reserved.
//

#import "CDAddressPickView.h"
#import "UIView+extension.h"
#import "CDAddressPickViewModel.h"

#define BottomViewH 240

@interface CDAddressPickView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, assign) NSInteger provinceIndex,citieIndex,areaIndex;
@property (nonatomic, copy) CDAddressBlock sureBlock;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) CDAddressPickViewModel *pickViewModel;
@end

@implementation CDAddressPickView

+ (void)createAddressPickViewSelectBlock: (CDAddressBlock)block {

    CDAddressPickView *pickView = [[CDAddressPickView alloc] initAddressPickViewSelectBlock:block];
    [pickView show];
}

- (instancetype)initAddressPickViewSelectBlock: (CDAddressBlock)block {
    
    self = [super init];
    if (self) {
        
        self.sureBlock = block;
        self.frame = [UIScreen mainScreen].bounds;
        [self setupView];
    }
    return self;
}
#pragma mark - Intial Methods
- (void)setupView {
    
    self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];

    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.pickerView];
    [self.bottomView addSubview:self.toolBar];
    [self.toolBar setBackgroundColor:UIColor.whiteColor];
    [self.toolBar setBarTintColor:UIColor.whiteColor];
    
    self.toolBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 40.0);
    self.pickerView.frame = CGRectMake(0, CGRectGetMaxY(self.toolBar.frame), CGRectGetWidth(self.bottomView.bounds), CGRectGetHeight(self.bottomView.bounds) - CGRectGetHeight(self.toolBar.bounds));
}
#pragma mark - Target Methods


#pragma mark - Public Methods

#pragma mark - Private Method
- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.bottomView.y = self.height;
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomView.y = self.height - BottomViewH;
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomView.y = self.height;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)closeButtonClick: (UIButton *)closeButton {
    
    [self hide];
}

- (void)sureButtonClick: (UIButton *)sureButton {
    
    if (self.sureBlock) {
        self.sureBlock(self.pickViewModel);
    }
    [self hide];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self hide];
}

- (void)setSelectedModelWithProvinceIndex:(NSInteger)provinceIndex
                           withCitieIndex:(NSInteger)citieIndex
                            withAreaIndex:(NSInteger)areaIndex {
    
      self.pickViewModel.selectedProvince = self.pickViewModel.provinces[provinceIndex];
      self.pickViewModel.selectedCitie = self.pickViewModel.selectedProvince.city[citieIndex];
      self.pickViewModel.selectedArea = self.pickViewModel.selectedCitie.district[areaIndex];
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0: {
            
            return self.pickViewModel.provinces.count;
        };
        case 1: {
            
            return self.pickViewModel.provinces[self.provinceIndex].city.count;
        }
        case 2: {
            
            return self.pickViewModel.provinces[self.provinceIndex].city[self.citieIndex].district.count;
        };
        default: {
            return 0;
        }
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0: {
            return self.pickViewModel.provinces[row].name;
        }
        case 1: {
            return self.pickViewModel.provinces[self.provinceIndex].city[row].name;
        }
        case 2: {
            return self.pickViewModel.provinces[self.provinceIndex].city[self.citieIndex].district[row].name;
        }
        default: {
            return nil;
        }
    }
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (component) {
        case 0: {
            
            self.provinceIndex = row;
            self.citieIndex = 0;
            self.areaIndex = 0;
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            break;
        }
        case 1: {
            
            self.citieIndex = row;
            self.areaIndex = 0;
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            break;
        }
        case 2: {
            
            self.areaIndex = row;
            NSInteger areaCount = self.pickViewModel.provinces[self.provinceIndex].city[self.citieIndex].district.count;
            if (row > areaCount) {
                self.areaIndex = areaCount - 1;
                [pickerView selectRow:self.areaIndex inComponent:2 animated:YES];
            }
            break;
        }
        default:
            break;
    }
    [self setSelectedModelWithProvinceIndex:self.provinceIndex withCitieIndex:self.citieIndex withAreaIndex:self.areaIndex];
}
#pragma mark - Setter Getter Methods
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - BottomViewH, self.width, BottomViewH)];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIToolbar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc]init];
        [_toolBar setTintColor:[UIColor grayColor]];
        [_toolBar setBackgroundColor:[UIColor whiteColor]];
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemCancel) target:self action:@selector(closeButtonClick:)];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(sureButtonClick:)];
        UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixItem.width = 24.0;

        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

        _toolBar.items = @[fixItem,cancelItem,flexItem,doneItem,fixItem];
    }
    return _toolBar;
}

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]init];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

- (CDAddressPickViewModel *)pickViewModel {
    if (!_pickViewModel) {
        _pickViewModel = [[CDAddressPickViewModel alloc]init];
    }
    return _pickViewModel;
}
@end
