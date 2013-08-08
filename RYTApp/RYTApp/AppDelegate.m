//
//  AppDelegate.m
//  RYTApp
//
//  Created by lic on 12-11-8.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window;
@synthesize root;
- (void)dealloc
{
//    [_window release];
    [window release];
    [root release];
    [baseNavController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    root =[[RootViewController  alloc]init];
    
    baseNavController =[[BaseNavViewController alloc] initWithRootViewController:root];
    [self.window addSubview:root.tabbarMenuView];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window addSubview:baseNavController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark =====
#pragma mark ===== 加载对应的 menu view==========
- (void)loadMenuViewBySelectedMenu:(MenuComponent*)menu{

 
    switch ([menu.menuId intValue]) {
        case 1:
            [self removeAllSubViews:root.view];
            [root.view addSubview:root.mainMenuView];
            break;
        case 2:
            [self removeAllSubViews:root.mainMenuView];
            UILabel   *lab =[[UILabel  alloc]initWithFrame:CGRectMake(20, 90, 60, 66)];
            lab.text=@"2222";
            [root.view  addSubview:lab];
            [lab release];
            break;
        case 3:
            [self removeAllSubViews:root.view];
            [root.menuPagesView loadMenuPages:root._menuLists];
            [root.view addSubview:root.menuPagesView];
           
            break;
        case 4:
            [root.view addSubview:root.mainMenuView];
            break;
        case 5:
            [root.view addSubview:root.mainMenuView];
            break;
        default:
            [root.view addSubview:root.mainMenuView];
            break;
    }
}
#pragma mark ===
#pragma mark ===
- (void)loadMenuSelected:(MenuComponent*)menu{
    switch ([menu.menuId intValue]) {
        case 1:
            channelViewController =[[ChannelViewController alloc]init];
            [baseNavController pushViewController:channelViewController animated:YES];
            [channelViewController release];
            break;
        case 2:
            channelViewController =[[ChannelViewController alloc]init];
            channelViewController.view.backgroundColor =[UIColor  blueColor];
            [baseNavController pushViewController:channelViewController animated:YES];
            [channelViewController release];
            break;
        default:
            break;
    }


}
- (void)removeAllSubViews:(id)superView{
    for (UIView   *view  in [superView subviews] ) {
        if (![view isKindOfClass:[TabbarMenuView class]]) {
             [view removeFromSuperview];
        }
       
    }
}
@end
