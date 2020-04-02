//
//  CDViewController.m
//  CDAddressPickView
//
//  Created by 513433750@qq.com on 04/01/2020.
//  Copyright (c) 2020 513433750@qq.com. All rights reserved.
//

#import "CDViewController.h"
#import "CDAddressPickView.h"

@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [CDAddressPickView createAddressPickViewSelectBlock:^(id obj) {

        CDAddressPickViewModel *model = (CDAddressPickViewModel *)obj;
        NSString *province = model.selectedProvince.name;
        NSString *city = model.selectedCitie.name;
        NSString *area = model.selectedArea.name;
        NSString *addressStr = [province isEqualToString:city] ? [NSString stringWithFormat:@"%@%@", province, area] : [NSString stringWithFormat:@"%@%@%@", province, city, model.selectedArea.name];
        NSLog(@"addressStr %@",addressStr);
    }];
}

@end
