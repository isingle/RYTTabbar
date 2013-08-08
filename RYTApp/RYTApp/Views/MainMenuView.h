//
//  MainMenuView.h
//  RYTApp
//
//  Created by lic on 12-11-14.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuComponent.h"
@interface MainMenuView : UIView<MenuSelectedDelegate,UIScrollViewDelegate>{

    NSMutableArray            *menuArray;
    MenuComponent             *menuComponent_;
}
@property (nonatomic,retain)MenuComponent   *menuComponent_;
@property (nonatomic,retain)NSMutableArray            *menuArray;
-(void)loadMainMenu:(NSArray*)menuLists;
@end
