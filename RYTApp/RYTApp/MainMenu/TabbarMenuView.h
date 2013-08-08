//
//  TabbarMenuView.h
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuComponent.h"
#import "ConfigManager.h"
//@class MenuComponent;
@interface TabbarMenuView : UIView<MenuSelectedDelegate>{

    MenuComponent        *menuComponent;
    NSMutableArray       *menuItems;
    BOOL                 isSelected;
}
@property(nonatomic,retain)NSMutableArray   *menuItems;

-(void)initTabbarMenu:(NSArray*)menuLists;
-(void)setDefaultComponent;
-(void)setMenuItemSelectedForTabbarMenuView:(MenuComponent*)menuComp;
-(void)setMenuSelectedByIndex:(int)index;
-(void)setAllMenuItemsUnselected;
@end
