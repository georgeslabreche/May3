//
//  ImageViewController.m
//  May3
//
//  Created by Georges Labreche on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id) initWithTitle:(NSString *) title buttonImageFilename:(NSString*) buttonFilename andImageFilename:(NSString*)imageFilename{
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        // The main image view
        UIImage *viewImage = [UIImage imageNamed:imageFilename];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:viewImage];
        self.view = imageView;
        
        self.title = title;
        
        // title
        self.tabBarItem.title = title;
        
        // tab bar for this image
        UIImage *tabBarItemImage = [UIImage imageNamed:buttonFilename];
        self.tabBarItem.image = tabBarItemImage;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

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
