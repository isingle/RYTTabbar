//
//  MainMenuView.m
//  RYTApp
//
//  Created by lic on 12-11-14.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "MainMenuView.h"
#import "AppDelegate.h"
@implementation MainMenuView
@synthesize menuComponent_,menuArray;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame =CGRectMake(0, 0, 320, 480-20-44-44);
        self.backgroundColor =[UIColor  clearColor];
    }
    return self;
}

-(void)loadMainMenu:(NSArray*)menuLists{


    
    if (menuArray ==nil) {
        menuArray =[[NSMutableArray alloc] init];
    }
    for (MenuComponent  *menuComp  in  menuArray) {
        [menuComp  removeFromSuperview];
    }
    [menuArray  removeAllObjects];
    
    int x =0 ;
    int y =0 ;
    int n =[menuLists count];
    for (int i=0; i<n; i++) {
        x =(SCREEN_WIDTH -MENU_COMPONENT_V_NUM*MENU_COMPONENT_WIDTH -(MENU_COMPONENT_V_NUM-1)*MENU_COMPONENT_H_SPACE_3)/2 +  (MENU_COMPONENT_WIDTH + MENU_COMPONENT_H_SPACE_3) * (i % MENU_COMPONENT_V_NUM);
        y = 20 + (MENU_COMPONENT_HEIGHT + MENU_COMPONENT_V_SPACE) * (i / MENU_COMPONENT_V_NUM);
        NSDictionary   *dic =[menuLists objectAtIndex:i];
    
        MenuComponent * menuComponent =[[MenuComponent alloc] initWithFrame:CGRectMake(x, y, MENU_COMPONENT_WIDTH, MENU_COMPONENT_HEIGHT) menuType:LPMainMenuPanesView  ];
        [menuComponent initMenuComponent:dic];
        [self addSubview:menuComponent];
        menuComponent.menuSelectedDelegate =self;
        [menuComponent release];

    }
}

#pragma mark ====
#pragma mark ====  =======
-(void)didSelectedMenu:(MenuComponent *)menu{
   
    self.menuComponent_ =menu ;
    
}
-(void)endTouchMenuComponent{

    
    [(AppDelegate*)[UIApplication sharedApplication].delegate  loadMenuSelected:menuComponent_];
}

-(void)dealloc{

    [menuComponent_ release];
    [menuArray release];
    [super dealloc];
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
