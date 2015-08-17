//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* UIvView= @{SECTION: @"UIView", MENU: @[
                                     @{TITLE: @"Swift to ObjectiveC", CLASS: @"SwiftToObjectiveCController"},
                                     @{TITLE: @"Multi Convert Swift", CLASS: @"MultiConvertController"},
                                     @{TITLE: @"Hoat hinh UIVIEW", CLASS: @"HoatHinhController"},
                                     @{TITLE: @"NestedSquares", CLASS: @"NestedSquares"},
                                     @{TITLE: @"flyingbird", CLASS: @"flyingbird"},
                                      @{TITLE: @"StartsField", CLASS: @"StartsField"},
                                      @{TITLE: @"HexColor", CLASS: @"Hex_2"},
                                     ]};
    NSDictionary* AraayDemo= @{SECTION: @"Araay", MENU: @[
                                       @{TITLE: @"Query Array", CLASS: @"QueryArray"},
                                       @{TITLE: @"Read number", CLASS: @"DocSo"},
                                       @{TITLE: @"Quick Sort", CLASS: @"SapXepArray"},
                                       ]};
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                     @{TITLE: @"Zigzac", CLASS: @"ZigzacController"},
                                     @{TITLE: @"Weather", CLASS: @"WeatherController"},
                                     @{TITLE: @"IamRick", CLASS: @"IamRickController"},
                                    @{TITLE: @"Selector", CLASS: @"SelectorController"},
                                    @{TITLE: @"Slider", CLASS: @"Slider"},
                                    @{TITLE: @"LED", CLASS: @"LEDController"},
                                    @{TITLE: @"TunOnOff", CLASS: @"TurnOnOff"},
                                     @{TITLE: @"scrollView", CLASS: @"ScrollViewController"},
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Inter LED", CLASS: @"InterLED"},
                                    @{TITLE: @"TransForm", CLASS: @"TransFormController"},
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Slider Advanced C", CLASS: @"SilderAdvanced"}
                             ]};
    mainScreen.menu = @[UIvView, basic,AraayDemo, intermediate, advanced];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
