//
//  GraphicAppDelegate.m
//  Graphic
//
//  Created by Anuj Shah on 10/14/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import "GraphicAppDelegate.h"
#import "GraphicView.h"
#import "GraphicClass.h"
#import "GraphicClock.h"
#import "GraphicRect.h"
@implementation GraphicAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
	// Override point for customization after application launch.
	UIScreen *screen = [UIScreen mainScreen];
    application.statusBarHidden = YES;
    
    CGRect clockView = CGRectMake(screen.applicationFrame.origin.x, screen.applicationFrame.origin.y, screen.applicationFrame.size.width/2,screen.applicationFrame.size.height/2);
    
    CGRect pieChart = CGRectMake(screen.applicationFrame.size.width/2, screen.applicationFrame.origin.y, screen.applicationFrame.size.width/2,screen.applicationFrame.size.height/2);
    
    CGRect rect = CGRectMake(screen.applicationFrame.origin.x, screen.applicationFrame.size.height/2, screen.applicationFrame.size.width/2,screen.applicationFrame.size.height/2);
    
    CGRect tri = CGRectMake(screen.applicationFrame.size.width/2, screen.applicationFrame.size.height/2, screen.applicationFrame.size.width/2,screen.applicationFrame.size.height/2);
    
    
	view = [[GraphicView alloc] initWithFrame: clockView];
    viewClock = [[GraphicClock alloc] initWithFrame:pieChart];
    viewRect = [[GraphicClass alloc] initWithFrame:rect];
    viewTriang = [[GraphicRect alloc] initWithFrame:tri];
    
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
    
    [self.window addSubview:viewRect];
	[self.window addSubview: view];
    [self.window addSubview:viewClock];
    [self.window addSubview:viewTriang];
    
    
    
	[self.window makeKeyAndVisible];
    //[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSLog(@"Application will resign active");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"Application did enter fore ground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background tothe inactive state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"Appliction will enter fore ground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"Application Did Become Active");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSLog(@"Application will terminate");
    
}

@end
