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
//  RBProvinceModel.h
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBProvinceModel : NSObject

@property (nonatomic, copy, setter=setId:) NSString *provinceId;
@property (nonatomic, copy) NSString *provinceName;
@property (nonatomic, copy) NSString *provinceCode;
@property (nonatomic, strong) NSMutableArray *cityArray;

+ (NSMutableArray *)getModelByProvinceListArray;

@end

@interface RBCityModel : NSObject

@property (nonatomic,   copy, setter=setId:) NSString *cityId;
@property (nonatomic,   copy) NSString *provinceCode;
@property (nonatomic,   copy) NSString *cityCode;
@property (nonatomic,   copy) NSString *cityName;
@property (nonatomic,   copy) NSString *provinceName;
@property (nonatomic, strong) NSMutableArray *zoneList;

+ (NSMutableArray *)transformCityModelByCityListArray:(NSArray *)array;

@end

@interface RBZoneModel : NSObject

@property (nonatomic,   copy, setter=setId:) NSString *zoneId;
@property (nonatomic,   copy) NSString *areaCode;
@property (nonatomic,   copy) NSString *provinceCode;
@property (nonatomic,   copy) NSString *cityCode;
@property (nonatomic,   copy) NSString *areaName;
@property (nonatomic,   copy) NSString *cityName;
@property (nonatomic,   copy) NSString *provinceName;

+ (NSMutableArray *)transformZoneModelByZoneListArray:(NSArray *)array;

@end
