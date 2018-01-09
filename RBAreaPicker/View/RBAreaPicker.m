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
//  RBAreaPicker.m
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "RBAreaPicker.h"
#import "RBProvinceModel.h"

@interface RBAreaPicker ()

@property (nonatomic, strong) NSMutableArray *provinceList;


@end

@implementation RBAreaPicker

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
        
        [self provinceList];
        self.province = [self.provinceList firstObject];
       // [self initAddress];
    }
    
    return self;
}

- (void)initAddress {
        NSInteger row1 = 0;
        NSInteger row2 = 0;
        NSInteger row3 = 0;
        
        if (self.selectZone == nil) {
            self.selectZone = [[RBZoneModel alloc] init];
            
            self.selectZone.provinceName = self.province.provinceName;
            
            RBCityModel *tempCityModel = self.province.cityArray.firstObject;
            self.selectZone.cityName = tempCityModel.cityName;
            
            RBZoneModel *tempZoneModel = tempCityModel.zoneList.firstObject;
            self.selectZone.areaName = tempZoneModel.areaName;
        }
        
        if (self.selectZone.provinceName.length > 0) {
            for (int i = 0; i < self.provinceList.count; i++) {
                RBProvinceModel *province = self.provinceList[i];
                if ([province.provinceName isEqualToString:self.selectZone.provinceName]) {
                    row1 = i;
                    self.province = province;
                    break;
                }
            }
        }
        
        if (self.selectZone.cityName.length > 0) {
            for (int i = 0; i < self.province.cityArray.count; i++) {
                RBCityModel *city = self.province.cityArray[i];
                if ([city.cityName isEqualToString:self.selectZone.cityName]) {
                    row2 = i;
                    self.city = city;
                    break;
                }
            }
        }
        
        if (self.selectZone.areaName.length > 0) {
            for (int i = 0; i < self.city.zoneList.count; i++) {
                RBZoneModel *zone = self.city.zoneList[i];
                if ([zone.areaName isEqualToString:self.selectZone.areaName]) {
                    row3 = i;
                    self.zone = zone;
                    break;
                }
            }
        }
        
        [self selectRow:row1 inComponent:0 animated:YES];
        if (self.province.cityArray.count > 0) {
            [self selectRow:row2 inComponent:1 animated:YES];
        }
        if (self.city.zoneList.count > 0) {
            [self selectRow:row3 inComponent:2 animated:YES];
        }
}

- (NSMutableArray *)provinceList {
    if (!_provinceList) {
        _provinceList = [RBProvinceModel getModelByProvinceListArray];
    }
    return _provinceList;
}

- (void)setProvince:(RBProvinceModel *)province {
    if (_province != province) {
        _province = province;
    }
    self.city = [self.province.cityArray firstObject];
    [self reloadComponent:1];
    [self selectRow:0 inComponent:1 animated:YES];
}

- (void)setCity:(RBCityModel *)city {
    if (_city != city) {
        _city = city;
    }
    self.zone = [self.city.zoneList firstObject];
    [self reloadComponent:2];
    [self selectRow:0 inComponent:2 animated:YES];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceList.count;
    }
    else if (component == 1) {
        if (self.province.cityArray.count > 0) {
            return self.province.cityArray.count;
        }
        return 0;
    }
    else if (component == 2) {
        if (self.city.zoneList.count > 0) {
            return self.city.zoneList.count;
        }
        return 0;
    }
    else {
        return 0;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.province = self.provinceList[row];
    }
    else if (component == 1) {
        if (self.province.cityArray.count > 0) {
            self.city = self.province.cityArray[row];
        }
    }
    else if (component == 2) {
        if (self.city.zoneList.count > 0) {
            self.zone = self.city.zoneList[row];
        }
    }
    
    NSLog(@"%@-%@-%@", self.province.provinceName, self.city.cityName, self.zone.areaName);
    
    if (self.block) {
        self.block(self.province, self.city, self.zone);
    }
    else {
        NSLog(@"block is not exsit");
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *showText = @"";
    if (component == 0) {
        RBProvinceModel *province = self.provinceList[row];
        showText = province.provinceName;
    } else if (component == 1) {
        RBCityModel *city = self.province.cityArray[row];
        showText = city.cityName;
    } else if (component == 2) {
        RBZoneModel *zone = self.city.zoneList[row];
        showText = zone.areaName;
    }

    return showText;
}

@end
