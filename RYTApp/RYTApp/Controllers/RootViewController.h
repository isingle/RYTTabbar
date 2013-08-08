//
//  RootViewController.h
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarMenuView.h"
#import "MainMenuView.h"
#import "MenuPagesView.h"
@interface RootViewController : UIViewController{

    TabbarMenuView      *tabbarMenuView;
    MainMenuView        *mainMenuView;
    MenuPagesView       *menuPagesView;
    NSArray             *_menuLists;
}
@property(nonatomic, retain)TabbarMenuView  *tabbarMenuView;
@property(nonatomic, retain)MainMenuView  *mainMenuView;
@property(nonatomic, retain)MenuPagesView  *menuPagesView;
@property(nonatomic, retain)NSArray     *_menuLists;
@end
