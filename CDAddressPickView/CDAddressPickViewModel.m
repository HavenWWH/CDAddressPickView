//
//  CDAddressPickViewModel.m
//  FT_iPhone
//
//  Created by 吴文海 on 2019/11/29.
//  Copyright © 2019 ChangDao. All rights reserved.
//

#import "CDAddressPickViewModel.h"


@implementation CDAreas


- (instancetype)initWithDictionary:(NSDictionary*)otherDictionary {
    self = [super init];
    if (self) {
        
        if ([otherDictionary isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:otherDictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"undefine %@",key);
}

@end


@implementation CDCities

- (instancetype)initWithDictionary:(NSDictionary*)otherDictionary {
    
    self = [super init];
    if (self) {
        
        if ([otherDictionary isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:otherDictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"undefine %@",key);
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"district"]) {
        NSMutableArray<CDAreas*> * childrenArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in value) {
            CDAreas * children = [[CDAreas alloc] initWithDictionary:dic];
            [childrenArray addObject:children];
        }
        self.district = childrenArray;
    }
}

@end



@implementation CDProvinces

- (instancetype)initWithDictionary:(NSDictionary*)otherDictionary {
    
    self = [super init];
    if (self) {
        
        if ([otherDictionary isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:otherDictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"undefine %@",key);
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"city"]) {
        NSMutableArray<CDCities*> * childrenArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in value) {
            CDCities * children = [[CDCities alloc] initWithDictionary:dic];
            [childrenArray addObject:children];
        }
        self.city = childrenArray;
    }
}


@end


@implementation NSArray (JSON)
+ (NSArray *)loadJsonOfBundlePathForResource:(NSString*)name {
    
    NSString *provincesPath = [[NSBundle bundleForClass:[CDAddressPickViewModel class]] pathForResource:name ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:provincesPath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    dic = dic[@"root"];
    NSArray *temArray = [NSArray arrayWithObject:dic[@"province"]];
    return temArray;
}
@end

@implementation CDAddressPickViewModel


- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSArray * temArray = [NSArray loadJsonOfBundlePathForResource:@"province_data"];
        NSMutableArray<CDProvinces*> * provinceArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in [temArray firstObject]) {
            CDProvinces * provinces = [[CDProvinces alloc] initWithDictionary:dic];
            [provinceArray addObject:provinces];
        }
        self.provinces = provinceArray;
        
        self.selectedProvince = self.provinces.firstObject;
        self.selectedCitie = self.selectedProvince.city.firstObject;
        self.selectedArea = self.selectedCitie.district.firstObject;
    }
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ %@ %@", self.selectedProvince.name,self.selectedCitie.name,self.selectedArea.name];
}
@end
