//
//  MenuComponent.m
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "MenuComponent.h"
#import "TabbarMenuView.h"
#import "AppDelegate.h"
@implementation MenuComponent
@synthesize initX,initY,isSelected,menuId;
@synthesize menuSelectedDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame  menuType:(LPMainMenuType)menutype{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor  clearColor];
        lpMainMenuType =menutype;
       
    }
    return self;
}
#pragma mark ===
#pragma mark === 初始化单个菜单 ======= 
-(void)initMenuComponent:(NSDictionary*)dic{
    initX  =self.frame.origin.x;
    initY  =self.frame.origin.y;
    
 
    NSString  *unselectedStr =[dic objectForKey:@"unselected"];
    NSString  *selectedStr =[dic objectForKey:@"selected"];
    menuId  =[dic  objectForKey:@"menuId"];
    if (lpMainMenuType ==LPMainMenuPanesView) {  //主菜单 九宫格单个菜单
        if (menuName ==nil) {
            menuName =[[UILabel  alloc] initWithFrame:CGRectMake(0, 0, 90, self.frame.size.height)];
           
        }
        unSelectedImg =[UIImage imageNamed:unselectedStr];
        selectedImg =[UIImage  imageNamed:selectedStr];
        
        bgView =[[UIImageView  alloc]initWithFrame:CGRectMake((self.frame.size.width-unSelectedImg.size.width)/2, 0, unSelectedImg.size.width, unSelectedImg.size.height)];
        bgView.image =unSelectedImg;
        [self addSubview:bgView];
        
        menuName.text =[dic objectForKey:@"title"];
        menuName.font =[UIFont  systemFontOfSize:12];
        menuName.textAlignment =UITextAlignmentCenter;
        menuName.textColor =[UIColor blackColor];
        menuName.center =CGPointMake(bgView.frame.origin.x+bgView.frame.size.width/2, bgView.frame.origin.y+75);
        menuName.backgroundColor =[UIColor clearColor];
        menuName.numberOfLines =1;
        menuName.lineBreakMode =UILineBreakModeMiddleTruncation;
        [self addSubview:menuName];
        
    }else if (lpMainMenuType ==LPMainMenuScrollView){ //下方tabbar  菜单
    
        unSelectedImg =[UIImage imageNamed:unselectedStr];
        selectedImg =[UIImage  imageNamed:selectedStr];
        
        if (unSelectedImg) {
            bgView =[[UIImageView  alloc]initWithFrame:CGRectMake((self.frame.size.width-unSelectedImg.size.width)/2, 0, unSelectedImg.size.width, unSelectedImg.size.height)];
            bgView.image =unSelectedImg;
            initImageViewX_=bgView.frame.origin.x;
            initImageViewY_=bgView.frame.origin.y;
            initImageViewWidth_=bgView.frame.size.width;
            initImageViewHeight_=bgView.frame.size.height;
            [self addSubview:bgView];
            
        }
    }

}
#pragma mark =====
#pragma mark ===== 设置选中时图片=======
-(void)setSelectedImageView{
    isSelected =YES;
    isZoomInStop=NO;
    [UIView beginAnimations:@"zoomselected" context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(doAffterAnimationStop)];
    CGRect rect = bgView.frame;
    initImageViewX_ = rect.origin.x;
    initImageViewY_ = rect.origin.y;
    initImageViewWidth_ = rect.size.width;
    initImageViewHeight_ = rect.size.height;
    
    bgView.frame = rect;
    [UIView commitAnimations];
    bgView.image =selectedImg;
    
    menuName.textColor =[UIColor  whiteColor];

}
//
-(void)doAffterAnimationStop{

}
#pragma mark =====
#pragma mark ===== 设置未选中时图片======
-(void)setUnSelectedImageView{
    
    [UIView beginAnimations:@"zoomOutImageView" context:NULL];
    [UIView setAnimationDuration:0.3];
    bgView.frame = CGRectMake(initImageViewX_, initImageViewY_, initImageViewWidth_, initImageViewHeight_);
    [UIView commitAnimations];
    
	
	bgView.image = unSelectedImg;
	menuName.textColor = [UIColor colorWithRed:(float)0xc6/255.0 green:(float)0xc6/255.0 blue:(float)0xc5/255.0 alpha:1.0];


}

#pragma mark ============touch event 点击单个菜单view时触发的事件===========
#pragma mark =======
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSSet  *allTouches = [event allTouches];
    int  num =[allTouches count];
    if (num ==1) {
        UITouch    *touch =[[touches  allObjects] objectAtIndex:0];
        touchesBeganPoint_ =[touch locationInView:self];
        isSelected =YES;
        if (lpMainMenuType==LPMainMenuPanesView) {
            bgView.image =selectedImg;
            
            if (menuSelectedDelegate) {
                [menuSelectedDelegate didSelectedMenu:self];
            }
            
        }else if(lpMainMenuType==LPMainMenuScrollView){
         
            [(TabbarMenuView*)self.superview  setAllMenuItemsUnselected];
            bgView.image =selectedImg;
            [self  setSelectedImageView];
            if (menuSelectedDelegate) {  //回调自身的delegate方法
                [menuSelectedDelegate didSelectedMenu:self];
            }
        }
        
    }

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    NSSet *allTouches = [event allTouches];
    
    switch ([allTouches count]) {
        case 1:
        {
            if (lpMainMenuType == LPMainMenuPanesView) {
                bgView.backgroundColor = [UIColor clearColor];
                bgView.alpha = 1.0;
                bgView.image = unSelectedImg;
                }
            
			UITouch *touch = [[touches allObjects] objectAtIndex:0];
			CGPoint currentTouchLocation = [touch locationInView:self.superview];
			
			if ((currentTouchLocation.x >= self.frame.origin.x) && (currentTouchLocation.x <= (self.frame.origin.x + MENU_COMPONENT_WIDTH))
				&& (currentTouchLocation.y >= self.frame.origin.y) && (currentTouchLocation.y <= (self.frame.origin.y + MENU_COMPONENT_HEIGHT)))
			{
				if (menuSelectedDelegate)//回调自身的delegate方法
				{
                    [menuSelectedDelegate  endTouchMenuComponent];
//                [(AppDelegate*)[UIApplication sharedApplication].delegate loadMenuViewBySelectedMenu:self];

				}
//
			}
			else
			{
//				if (delegate && [delegate respondsToSelector:@selector(removeTheLargerImageView)])
//				{
//					[delegate removeTheLargerImageView];
//				}
			}
            
        }
            break;
        default:
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc{
    if (menuName) {
        [menuName release];
    }
    [menuId  release];
    [super dealloc];
}
@end
