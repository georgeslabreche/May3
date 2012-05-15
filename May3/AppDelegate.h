//
//  AppDelegate.h
//  May3
//
//  Created by Georges Labreche on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundPlayer.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    SoundPlayer *soundPlayer;
}

@property (strong, nonatomic) UIWindow *window;

@end
