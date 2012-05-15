//
//  AnimatedImageViewController.m
//  May3
//
//  Created by Georges Labreche on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimatedImageViewController.h"

@interface AnimatedImageViewController ()

@end

@implementation AnimatedImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id) initWithTitle:(NSString *) title buttonImageFilename:(NSString*) buttonFilename animationFramesDirectory:(NSString*)directory imageType: (NSString *) imageType andAnimationDuration:(NSTimeInterval) duration{
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Animation duration
        animationDuration = duration;
        
        // title
        self.title = title;
        self.tabBarItem.title = title;
        
        // tab bar for this image
        UIImage *tabBarItemImage = [UIImage imageNamed:buttonFilename];
        self.tabBarItem.image = tabBarItemImage;
        
        // Create array of UIImage frames for the animation of the image view.
        NSArray *animationFramesImagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:imageType inDirectory:directory];
        
        animationImageFrames = [[NSMutableArray alloc]init];
        
        for (NSInteger i = 0; i < [animationFramesImagePaths count]; i++){
            NSString *animationFrameImagePath = [animationFramesImagePaths objectAtIndex: i];
            
            UIImage *frameImage = [UIImage imageWithContentsOfFile: animationFrameImagePath];
            
            [animationImageFrames addObject:frameImage];
            
        }
        
        
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    // The main image view
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.animationImages = animationImageFrames;
    imageView.animationDuration = animationDuration;
    
    self.view = imageView;
    
    [imageView startAnimating];
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
