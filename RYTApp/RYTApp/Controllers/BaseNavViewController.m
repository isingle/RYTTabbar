//
//  BaseNavViewController.m
//  RYTApp
//
//  Created by lic on 12-11-14.
//  Copyright (c) 2012年 l.c. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController



- (void)viewDidLoad
{
    
    self.view.frame = CGRectMake(0, 20, 320, 460);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
