//
//  CDAddressPickViewModel.h
//  FT_iPhone
//
//  Created by 吴文海 on 2019/11/29.
//  Copyright © 2019 ChangDao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface CDAreas : NSObject
/// 编码
@property (nonatomic, copy) NSString *zipcode;
/// 区名
@property (nonatomic, copy) NSString *name;
@end

@interface CDCities : NSObject
/// 市名
@property (nonatomic, copy) NSString *name;
/// 子区
@property (nonatomic, strong) NSArray<CDAreas*> *district;
@end

@interface CDProvinces : NSObject

/// 省名
@property (nonatomic, copy) NSString *name;
/// 子市
@property (nonatomic, strong) NSArray<CDCities*> *city;
@end

@interface CDAddressPickViewModel : NSObject
/// 子省
@property (nonatomic, strong) NSArray<CDProvinces*> *provinces;
/// 选中的省
@property (nonatomic, strong) CDProvinces *selectedProvince;
/// 选中的市
@property (nonatomic, strong) CDCities *selectedCitie;
/// 选中的区
@property (nonatomic, strong) CDAreas *selectedArea;
@end

NS_ASSUME_NONNULL_END
