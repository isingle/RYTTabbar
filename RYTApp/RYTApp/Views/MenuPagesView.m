//
//  MenuPagesView.m
//  RYTApp
//
//  Created by lic on 12-11-16.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "MenuPagesView.h"

@implementation MenuPagesView
@synthesize numberOfPages,menuArray;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        menuPageScrollView =[[UIScrollView  alloc] init];
        menuPageScrollView.frame =CGRectMake(0, 0, SCREEN_WIDTH, CONTENT_VIEW_HEIGHT);
        menuPageScrollView.delegate =self;
        menuPageScrollView.backgroundColor =[UIColor grayColor];
        menuPageScrollView.pagingEnabled =YES;
        numberOfPages =1;
        pageControlUsed =NO;
        [self addSubview:menuPageScrollView];
        
        
        pageControl =[[UIPageControl alloc]initWithFrame:CGRectMake(0, 384-44, 320, 18)];
        pageControl.userInteractionEnabled =YES;
        
        
        [self addSubview:pageControl];
        
    }
    return self;
}

- (void)loadMenuPages:(NSArray*)menulists{
    numberOfPages =([menulists count] % MENU_COMPONENT_NUM ==0)?([menulists count]/MENU_COMPONENT_NUM):([menulists count]/MENU_COMPONENT_NUM +1);
    pageControl.numberOfPages =numberOfPages;
    
    menuPageScrollView.contentSize =CGSizeMake(numberOfPages*SCREEN_WIDTH,menuPageScrollView.frame.size.height);
    
//    self.menuArray =menulists;
    
    if (menuArray ==nil) {
        menuArray =[[NSMutableArray alloc] init];
    }
    if ([menuArray count] >0) {
        [menuArray removeAllObjects];
    }
    for (int i =0; i <numberOfPages; i++) {
        MainMenuView  *mainView =[[MainMenuView alloc]init];
        
        NSRange  range;
        NSArray  *pageMenus;
        if ((i +1)<numberOfPages) {
            range =NSMakeRange(i *MENU_COMPONENT_NUM, MENU_COMPONENT_NUM);
        }else{
            range =NSMakeRange(i *MENU_COMPONENT_NUM, [menulists count] -i* MENU_COMPONENT_NUM);
        
        }
        pageMenus =[menulists  subarrayWithRange:range];
        [mainView loadMainMenu:pageMenus];
        
        [menuArray addObjectsFromArray:mainView.menuArray];
        menuPageArray =[[NSMutableArray alloc] init];
        [menuPageArray addObject:mainView];
        [mainView release];
//        [self initScrollViewWithPage:i];
    }
    
    [self  initScrollViewWithPage:0];
    [self  initScrollViewWithPage:1];
}
- (void)initScrollViewWithPage:(NSInteger)pagenumber{

    MainMenuView  *mainView =[menuPageArray  objectAtIndex:pagenumber];
    [menuPageScrollView addSubview:mainView];
    
}

- (void)switchPage:(id)sender{
    int pagenum =pageControl.currentPage;
    
    [self initScrollViewWithPage:pagenum-1];
    [self initScrollViewWithPage:pagenum];
    [self initScrollViewWithPage:pagenum+1];
    
    CGRect frame =menuPageScrollView.frame;
    frame.origin.x =frame.size.width *pagenum;
    frame.origin.y =0;
    [menuPageScrollView scrollRectToVisible:frame animated:YES];
    pageControlUsed =YES;
}
#pragma mark ======
#pragma maek ====== ========
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (pageControlUsed) {
        return;
    }
    CGFloat pageWidth = menuPageScrollView.frame.size.width;
    int page = floor((menuPageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    [self initScrollViewWithPage:page-1];
    [self initScrollViewWithPage:page];
    [self initScrollViewWithPage:page+1];

    pageControlUsed =NO;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageControlUsed =NO;
}

- (void)dealloc{
    [menuPageScrollView  release];
    [pageControl release];
    [menuArray release];
    [menuPageArray release];
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
