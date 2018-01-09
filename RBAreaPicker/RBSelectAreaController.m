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
//  RBSelectAreaController.m
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "RBSelectAreaController.h"
#import "RBNoPasteTextField.h"
#import "RBAreaPicker.h"
#import <IQUIView+IQKeyboardToolbar.h>
#import <IQKeyboardManager.h>

@interface RBSelectAreaController ()

@property IBOutlet RBNoPasteTextField *notCanSeeTF;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation RBSelectAreaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupMyUI];

}

- (void)setupMyUI {
    RBAreaPicker *areaPicker = [[RBAreaPicker alloc] init];
    //    areaPicker.delegate = self;
    //    areaPicker.dataSource = self;
    __weak RBSelectAreaController *weakSelf = self;
    areaPicker.block = ^(RBProvinceModel *provinceModel, RBCityModel *cityModel, RBZoneModel *areaModel) {
            weakSelf.selectProvince = provinceModel;
            weakSelf.selectCity = cityModel;
            weakSelf.selectZone = areaModel;
    };
    
    self.notCanSeeTF.tintColor = [UIColor clearColor];
    self.notCanSeeTF.inputView = areaPicker;
    
    [self.notCanSeeTF addLeftRightOnKeyboardWithTarget:self leftButtonTitle:@"取消" rightButtonTitle:@"完成" leftButtonAction:@selector(cancelAction) rightButtonAction:@selector(areaDoneAction) titleText:@"请选择所在区域"];
        [self changeLeftColor:[UIColor blackColor] rightColor:[UIColor blackColor] textField:self.notCanSeeTF];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.notCanSeeTF becomeFirstResponder];
}

- (void)cancelAction {
    [self.notCanSeeTF resignFirstResponder];
}

- (void)areaDoneAction {
    [self.notCanSeeTF resignFirstResponder];

    if (self.selectProvince == nil) {
        RBAreaPicker *picker = (RBAreaPicker *)self.notCanSeeTF.inputView;
        self.selectProvince = picker.province;
        self.selectCity = picker.city;
        self.selectZone = picker.zone;
    }
    
    NSString *areaStr = @"";
    if (self.selectZone) {
        areaStr = [NSString stringWithFormat:@"%@-%@-%@", self.selectProvince.provinceName, self.selectCity.cityName, self.selectZone.areaName];
    }
    else if (self.selectCity) {
        areaStr = [NSString stringWithFormat:@"%@-%@", self.selectProvince.provinceName, self.selectCity.cityName];
    }
    else if (self.selectProvince) {
        areaStr = [NSString stringWithFormat:@"%@", self.selectProvince.provinceName];
    }
    else {
        areaStr = @"暂无";
    }

    self.showLabel.text = areaStr;
}


- (IBAction)selectArea:(id)sender {
    [self.notCanSeeTF becomeFirstResponder];
    
}

- (void)changeLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor textField:(UITextField *)textField {
    
    UIView *accessoryView = textField.inputAccessoryView;
    if ([accessoryView isKindOfClass:[UIToolbar class]]) {
        UIToolbar *toolbar = (UIToolbar *)accessoryView;
        
        if (toolbar.items.count >=  2) {
            UIBarButtonItem *leftItem = [toolbar.items firstObject];
            leftItem.tintColor = leftColor;
            
            UIBarButtonItem *rightItem = [toolbar.items lastObject];
            rightItem.tintColor = rightColor;
        }
    }
}


- (IBAction)notCanSeeTF:(id)sender {
}
@end
