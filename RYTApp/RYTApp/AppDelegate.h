//
//  AppDelegate.h
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "MenuComponent.h"
#import "ConfigManager.h"
#import "BaseNavViewController.h"
#import "ChannelViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    RootViewController *root;
    BaseNavViewController *baseNavController;
    ChannelViewController *channelViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain)RootViewController *root;

- (void)loadMenuViewBySelectedMenu:(MenuComponent*)menu;
- (void)loadMenuSelected:(MenuComponent*)menu;
- (void)removeAllSubViews:(id)superView;
@end
