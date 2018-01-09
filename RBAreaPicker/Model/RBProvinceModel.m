//
/*****************************************
 *                                       *
 *  @dookay.com Internet make it happen  *
 *  ----------- -----------------------  *
 *  dddd  ddddd Internet make it happen  *
 *  o   o     o Internet make it happen  *
 *  k    k    k Internet make it happen  *
 *  a   a     a Internet make it happen  *
 *  yyyy  yyyyy Internet make it happen  *
 *  ----------- -----------------------  *
 *  Say hello to the future.		     *
 *  hello，未来。                   	     *
 *  未来をその手に。                        *
 *                                       *
 *****************************************/
//
//  RBProvinceModel.m
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "RBProvinceModel.h"

@implementation RBProvinceModel

- (NSMutableArray *)cityArray {
    if (_cityArray == nil) {
        _cityArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _cityArray;
}

+ (NSArray *)loadAllAreaData {
    
    NSString *pathName = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"json"];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:pathName];
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@", error);
    
    if (error == nil) {
        if ([obj isKindOfClass:[NSArray class]]) {
            return (NSArray *)obj;
        }
        else {
            return nil;
        }
    }
    else {
        NSLog(@"%@", error);
    }
    
    return nil;
}

+ (NSMutableArray *)getModelByProvinceListArray {
    NSMutableArray *provinceArray = [NSMutableArray array];

    NSArray *tempProvince = [self loadAllAreaData];
    
    if ([tempProvince isKindOfClass:[NSNull class]] || tempProvince == nil || tempProvince.count == 0) {
        return provinceArray;
    }
    
    for (NSDictionary *provinceDic in tempProvince) {
        @autoreleasepool {
            RBProvinceModel *provinceModel = [[RBProvinceModel alloc] init];
            [provinceModel setValuesForKeysWithDictionary:provinceDic[@"provinceDomain"]];
            provinceModel.cityArray = [RBCityModel transformCityModelByCityListArray:provinceDic[@"cityResponses"]];
            [provinceArray addObject:provinceModel];
        }
    }
    
    return provinceArray;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end

@implementation RBCityModel

- (NSMutableArray *)zoneList {
    if (_zoneList == nil) {
        _zoneList = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _zoneList;
}

+ (NSMutableArray *)transformCityModelByCityListArray:(NSArray *)array {
    NSMutableArray *cityArray = [NSMutableArray array];
    for (NSDictionary *cityDic in array) {
        if (cityDic) {
            RBCityModel *cityModel = [[RBCityModel alloc] init];
            [cityModel setValuesForKeysWithDictionary:cityDic[@"systemCityDomain"]];
            cityModel.zoneList = [RBZoneModel transformZoneModelByZoneListArray:cityDic[@"systemAreaDomain"]];
            [cityArray addObject:cityModel];
        }
        
    }
    
    return cityArray;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end

@implementation RBZoneModel

+ (NSMutableArray *)transformZoneModelByZoneListArray:(NSArray *)array {
    NSMutableArray *zoneArray = [NSMutableArray array];
    for (NSDictionary *zoneDic in array) {
        if (zoneDic) {
            RBZoneModel *zoneModel = [[RBZoneModel alloc] init];
            [zoneModel setValuesForKeysWithDictionary:zoneDic];
            [zoneArray addObject:zoneModel];
        }
        
    }
    
    return zoneArray;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
