//
//  MenuComponent.h
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//
//自定义单个菜单按钮

#import <UIKit/UIKit.h>
#import "ConfigManager.h"
//#import "TabbarMenuView.h"
@protocol MenuSelectedDelegate;
@interface MenuComponent : UIView{

    UIImageView        *bgView;
    UILabel            *menuName;
    
    UIImage            *unSelectedImg;
    UIImage            *selectedImg;
    
    int               initX;
    int               initY;
    LPMainMenuType    lpMainMenuType;
    
    /*
     初始图标的图片坐标和size
     */
    int                         initImageViewX_;
    int                         initImageViewY_;
    int                         initImageViewWidth_;
    int                         initImageViewHeight_;
    CGPoint                     touchesBeganPoint_;        //点击坐标
    BOOL                        isSelected;
    BOOL                        isZoomInStop;

    NSString                    *menuId;                //单个菜单id
    
    id<MenuSelectedDelegate>    menuSelectedDelegate;
    id        delegate;
}

@property (nonatomic, assign)int  initX;
@property (nonatomic, assign)int  initY;
@property (nonatomic, assign)BOOL isSelected;
@property (nonatomic, retain)NSString  *menuId;
@property (nonatomic, assign)id<MenuSelectedDelegate> menuSelectedDelegate;
-(id)initWithFrame:(CGRect)frame  menuType:(LPMainMenuType)menutype;
-(void)initMenuComponent:(NSDictionary*)dic;
-(void)setSelectedImageView;
-(void)setUnSelectedImageView;
@end
@protocol MenuSelectedDelegate <NSObject>

-(void)didSelectedMenu:(MenuComponent*)menu;
-(void)endTouchMenuComponent;
@optional
-(void)clickPoint:(CGPoint)point;

@end
