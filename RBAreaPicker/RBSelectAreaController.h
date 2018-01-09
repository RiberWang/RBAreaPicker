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
//  RBSelectAreaController.h
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBProvinceModel.h"

@interface RBSelectAreaController : UIViewController

@property (nonatomic, strong) RBZoneModel *selectZone;
@property (nonatomic, strong) RBCityModel *selectCity;
@property (nonatomic, strong) RBProvinceModel *selectProvince;

@end
