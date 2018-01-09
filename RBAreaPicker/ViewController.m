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
//  ViewController.m
//  RBAreaPicker
//
//  Created by Riber on 2017/12/29.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "ViewController.h"
#import "RBSelectAreaController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)test1:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RBSelectAreaController *selectAreaController = [storyBoard instantiateViewControllerWithIdentifier:@"RBSelectAreaController_ID"];
//    RBZoneModel *zoneModel = [[RBZoneModel alloc] init];
//    zoneModel.provinceName = @"河南";
//    zoneModel.cityName = @"商丘市";
//    zoneModel.provinceName = @"睢阳区";
//    selectAreaController.selectZone = zoneModel;
    [self.navigationController pushViewController:selectAreaController animated:YES];
}

- (IBAction)test2:(id)sender {
    
}

@end
