//
//  TabbarMenuView.m
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "TabbarMenuView.h"
#import "AppDelegate.h"
@implementation TabbarMenuView
@synthesize menuItems;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView  *bgView =[[UIImageView  alloc] initWithFrame:self.bounds ];
         
        bgView.image =[UIImage  imageNamed:@"menuBar.png"];
        [self addSubview:bgView];
    }
    return self;
}
-(void)initTabbarMenu:(NSArray*)menuLists{
    if (menuItems ==nil) {
         menuItems =[[NSMutableArray  alloc]init];
       
    }
    for (MenuComponent  *component in menuItems) {
        [component removeFromSuperview];
    }
    [menuItems  removeAllObjects];
    
    int x =MENU_LEFT_WIDTH_BOTTOMMENU;
    int y =(TABBARCONTROLLER_HEIGHT - MENU_COMPONENT_HEIGHT_BOTTOMMENU) / 2;

    int counts =[menuLists count];
    for (int i =0; i< counts; i++) {
        NSDictionary  *dic =[menuLists objectAtIndex:i];
        menuComponent =[[MenuComponent alloc] initWithFrame:CGRectMake(x, y, MENU_COMPONENT_WIDTH_BOTTOMMENU, MENU_COMPONENT_HEIGHT_BOTTOMMENU) menuType:LPMainMenuScrollView];
        [menuComponent initMenuComponent:dic];
        menuComponent.menuSelectedDelegate=self;
        [self addSubview:menuComponent];
        [menuItems addObject:menuComponent];
        [menuComponent release];
        x +=MENU_COMPONENT_WIDTH_BOTTOMMENU+MENU_COMPONENT_SPACE_BOTTOMMENU;
    }
    menuComponent.menuSelectedDelegate =self;
    [self setDefaultComponent];
}
-(void)setDefaultComponent{
    if ([menuItems count] ==0) {
        return;
    }
    MenuComponent  *defaultComponent =[menuItems objectAtIndex:0];
    [self setMenuItemSelectedForTabbarMenuView:defaultComponent];
}

-(void)setMenuItemSelectedForTabbarMenuView:(MenuComponent*)menuComp{
    menuComponent =nil;
    for (int i=0; i <[menuItems count]; i++) {
        MenuComponent *menuItem =[menuItems objectAtIndex:i];
        if (menuItem.isSelected ==YES) {
            menuItem.isSelected =NO;
            [menuItem setUnSelectedImageView];
        }
//        menuItem.menuId= @"1";   menuComp.menuId =@"1";
        if ([menuItem.menuId  isEqualToString:menuComp.menuId]) {
            [self setMenuSelectedByIndex:i];
            break;
        }
    }

}
-(void)setMenuSelectedByIndex:(int)index{
    if ([menuItems count] ==0) {
        return;
    }
    
    int selectedIndex =0;
    for (int i=0; i< [menuItems count]; i++) {
        MenuComponent  *item =[menuItems objectAtIndex:i];
        if (item.isSelected =YES) {
            item.isSelected =NO;
            [item setUnSelectedImageView];
        }
        if (i ==index) {
            selectedIndex =i;
            item.isSelected =YES;
            [item setSelectedImageView];
        }
    }
    
    
}
#pragma mark =====
#pragma mark ===== 选择一个时，将所有items 的状态设置为未选中状态=====
-(void)setAllMenuItemsUnselected{
    for (MenuComponent  *menu   in menuItems) {
        if (menu.isSelected ==YES) {
            menu.isSelected =NO;
            [menu setUnSelectedImageView];
        }
    }
    
}
-(void)dealloc{

    [menuItems release];
  
    [super dealloc];
}

#pragma mark ====
#pragma mark ==== 选中其中一个菜单  selectedmenucomponent delegate =======
- (void)didSelectedMenu:(MenuComponent *)menu{
    isSelected =YES;
    if (menu == menuComponent) {
        isSelected =NO;
        return;
    }
    menuComponent =menu;
    [self  setNeedsDisplay];


}
//点击结束后 触发的加载页面事件
- (void)endTouchMenuComponent{
 
    if (isSelected ==NO) {
        return;
    }
    [(AppDelegate*)[UIApplication sharedApplication].delegate loadMenuViewBySelectedMenu:menuComponent];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
