//
//  ConfigManager.h
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//
#define   APPLICATION  APPLICATION ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define   SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width   //320
#define   SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height  //480
#define   STATUS_BAR_HEIGHT   20
#define   NAVIGATION_BAR_HEIGHT   44
#define   CONTENT_VIEW_HEIGHT SCREEN_HEIGHT - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - TABBARCONTROLLER_HEIGHT

//手机银行菜单
#define MENU_COMPONENT_WIDTH 60
#define MENU_COMPONENT_HEIGHT 75
#define MENU_COMPONENT_V_SPACE 42
#define MENU_COMPONENT_H_SPACE 16
#define MENU_COMPONENT_H_SPACE_3 20
#define MENU_COMPONENT_V_NUM 4
#define MENU_COMPONENT_V_NUM_FINANCEASSISTANT 4
#define MENU_COMPONENT_IMAGE_HEIGHT 67
#define MENU_COMPONENT_WIDTH_BOTTOMMENU 60
#define MENU_COMPONENT_HEIGHT_BOTTOMMENU 38
#define TABBARCONTROLLER_HEIGHT 46
#define MENU_SHOW_BUTTON 18

#define MENU_LEFT_WIDTH_BOTTOMMENU			10
#define MENU_COMPONENT_SPACE_BOTTOMMENU		0

#define MENU_COMPONENT_NUM		12
#define MENU_COMPONENT_NUM_FINANCEASSISTANT 16


//菜单按钮类型
typedef enum LPMainMenuType {
    LPMainMenuPanesView,    //九宫格菜单
    LPMainMenuScrollView    //快捷菜单
} LPMainMenuType;
