//
//  AnimatedImageViewController.h
//  May3
//
//  Created by Georges Labreche on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedImageViewController : UIViewController{
    NSMutableArray *animationImageFrames;
    NSTimeInterval animationDuration;
}

-(id) initWithTitle:(NSString *) title buttonImageFilename:(NSString*) buttonFilename animationFramesDirectory:(NSString*)directory imageType: (NSString *) imageType andAnimationDuration:(NSTimeInterval) duration;
@end
