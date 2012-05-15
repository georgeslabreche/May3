//
//  AppDelegate.m
//  May3
//
//  Created by Georges Labreche on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ImageViewController.h"
#import "AnimatedImageViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create our view controllers
    AnimatedImageViewController *skeleton1_IVC = [[AnimatedImageViewController alloc]
                                                  initWithTitle:@"Walk"
                                                  buttonImageFilename:@"count.png" 
                                                  animationFramesDirectory:@"images/skeletons/walking" 
                                                  imageType:@"jpg" 
                                                  andAnimationDuration:2.0];
    
    AnimatedImageViewController *skeleton2_IVC = [[AnimatedImageViewController alloc]
                                                  initWithTitle:@"Dance" 
                                                  buttonImageFilename:@"count.png" 
                                                  animationFramesDirectory:@"images/skeletons/dancing" 
                                                  imageType:@"png" 
                                                  andAnimationDuration:1.0];
    
    ImageViewController *elephant_IVC = [[ImageViewController alloc]
                                         initWithTitle:(NSString *) @"Trumpet" 
                                         buttonImageFilename:(NSString*) @"count.png" 
                                         andImageFilename:(NSString*) @"elephant.png"];
    
    
    // Put them in an array
    NSArray *controllers = [NSArray arrayWithObjects:
                            skeleton1_IVC,
                            skeleton2_IVC,
                            elephant_IVC,
                            nil
                            ];
    
    // Create tab bar containing all the view controllers.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = controllers;
    
    tabBarController.delegate = self;
    
    // Play skeleton music because the first view has a skeleton
    soundPlayer = [[SoundPlayer alloc]init];
    [soundPlayer playSkeletonMusic];
    
   
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

//Tells the delegate that the user selected an item in the tab bar.
- (void) tabBarController: (UITabBarController *) tabBarController didSelectViewController: (UIViewController *) viewController {
    
	NSLog(@"%@!", viewController.title);
    
    if([viewController.title isEqualToString:@"Trumpet"]){
        // Only plays if it's not playing already
        [soundPlayer playElephantSound];
    }else{
        
        // If it's not the elephant view then it's a skeletong view.
        // Play skeleton view if it's not already playing.
        [soundPlayer playSkeletonMusic];
    }
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

@end
