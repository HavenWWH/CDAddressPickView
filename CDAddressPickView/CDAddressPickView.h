//
//  CDAddressPickView.h
//  FT_iPhone
//
//  Created by 吴文海 on 2019/11/29.
//  Copyright © 2019 ChangDao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDAddressPickViewModel.h"


typedef void(^CDAddressBlock)(id obj);


@interface CDAddressPickView : UIView

+ (void)createAddressPickViewSelectBlock:(CDAddressBlock)block;


@end
