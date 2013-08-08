//
//  RootViewController.m
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "RootViewController.h"
#import "ConfigManager.h"
#import "AppDelegate.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize tabbarMenuView,mainMenuView,menuPagesView;
@synthesize _menuLists;
- (void)viewDidLoad
{
     
    self.view.backgroundColor =[UIColor  clearColor];
   
//    tabbarMenuView =[[TabbarMenuView  alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-20-48-44, SCREEN_WIDTH, 48)];
   
    tabbarMenuView =[[TabbarMenuView  alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-44-20-48, SCREEN_WIDTH, 48)];
    NSDictionary  *dic1 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"1",@"menuId",nil];
    NSDictionary  *dic2 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"2",@"menuId",nil];
    NSDictionary  *dic3 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"3",@"menuId",nil];
    NSDictionary  *dic4 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"4",@"menuId",nil];
    NSDictionary  *dic5 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"5",@"menuId",nil];
//      NSDictionary  *dic6 =[[NSDictionary alloc] initWithObjectsAndKeys:@"联系我们",@"title",@"contact.png",@"unselected",@"contact_s.png",@"selected" ,@"5",@"menuId",nil];
    NSArray  *menuArray =[[NSArray alloc]initWithObjects:dic1,dic2,dic3,dic4,dic5, nil];

    NSDictionary  *dic11 =[[NSDictionary alloc] initWithObjectsAndKeys:@"个人业务1",@"title",@"personal_loan.png",@"unselected",@"personal_loan_s.png",@"selected" ,@"1",@"menuId",nil];
    NSDictionary  *dic22 =[[NSDictionary alloc] initWithObjectsAndKeys:@"个人业务2",@"title",@"personal_loan.png",@"unselected",@"personal_loan_s.png",@"selected" ,@"2",@"menuId",nil];
    NSDictionary  *dic33 =[[NSDictionary alloc] initWithObjectsAndKeys:@"个人业务3",@"title",@"personal_loan.png",@"unselected",@"personal_loan_s.png",@"selected" ,@"3",@"menuId",nil];
    NSDictionary  *dic44 =[[NSDictionary alloc] initWithObjectsAndKeys:@"个人业务4",@"title",@"personal_loan.png",@"unselected",@"personal_loan_s.png",@"selected" ,@"4",@"menuId",nil];
    NSDictionary  *dic55 =[[NSDictionary alloc] initWithObjectsAndKeys:@"个人业务5",@"title",@"personal_loan.png",@"unselected",@"personal_loan_s.png",@"selected" ,@"5",@"menuId",nil];
    NSArray  *mainmenuArray =[[NSArray alloc]initWithObjects:dic11,dic22,dic33,dic44,dic55,dic11,dic22,dic33,dic44,dic55,dic11,dic22,dic33,dic44,dic55, nil];
    
    [tabbarMenuView  initTabbarMenu:menuArray];
    mainMenuView =[[MainMenuView  alloc]init ];
    [mainMenuView  loadMainMenu:mainmenuArray];
    [self.view addSubview:mainMenuView];
    [self.view addSubview:tabbarMenuView];
    self._menuLists =mainmenuArray;
    menuPagesView =[[MenuPagesView alloc]init];
//    [menuPagesView loadMenuPages:mainmenuArray];
    
    [dic1 release];
    [dic2 release];
    [dic3 release];
    [dic4 release];
    [dic5 release];
//    [dic6 release];
    [dic11 release];
    [dic22 release];
    [dic33 release];
    [dic44 release];
    [dic55 release];
    
    [mainmenuArray release];
    [menuArray release];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)dealloc{
    [menuPagesView release];
    [_menuLists release];
    [tabbarMenuView release];
    [mainMenuView release];
    [super dealloc];
   
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
