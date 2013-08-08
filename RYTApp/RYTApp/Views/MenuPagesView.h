//
//  MenuPagesView.h
//  RYTApp
//
//  Created by lic on 12-11-16.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
@interface MenuPagesView : UIView<UIScrollViewDelegate>{
    UIScrollView      *menuPageScrollView;
    UIPageControl     *pageControl;
    BOOL              pageControlUsed;
    NSInteger         numberOfPages;
    NSMutableArray    *menuArray;
    NSMutableArray    *menuPageArray;

}
@property (nonatomic,assign) NSInteger    numberOfPages;
@property (nonatomic,retain) NSMutableArray  *menuArray;
- (void)loadMenuPages:(NSArray*)menulists;
- (void)initScrollViewWithPage:(NSInteger)pagenumber;
- (void)switchPage:(id)sender;
@end
