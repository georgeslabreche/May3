//
//  SoundPlayer.m
//  May3
//
//  Created by Georges Labreche on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundPlayer.h"

@implementation SoundPlayer

- (id) init{
    self = [super init];
    
    if(self){
        skeletonPlayer = [self buildPlayerWithResource:@"skeleton" ofType:@"mp3" inDirectory: @"sounds" withVolume:1.0  andNumberOfLoops:-1];
        elephantPlayer = [self buildPlayerWithResource:@"elephant" ofType:@"wav" inDirectory: @"sounds" withVolume:1.0  andNumberOfLoops:-1];
        
    }
    
    return self;
}

- (AVAudioPlayer *) buildPlayerWithResource:(NSString*)soundFilename ofType:(NSString*) type inDirectory:(NSString*) directoryName withVolume:(float) volume andNumberOfLoops:(NSInteger) numofLoops {
    
    AVAudioPlayer *player;
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle.");
        return nil;
    }
    
    //The path is the filename.
    
    NSString *path = [bundle pathForResource: soundFilename ofType: type inDirectory:directoryName];
    if (path == nil) {
        NSLog(@"could not get the mp3 sound path.");
        return nil;
    }
    
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"error == %@", error);
        return nil;
    }
    
    // player properties
    player.volume = volume;
    player.numberOfLoops = numofLoops;
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play.");
        return nil;
    } 
    
    return player;
}

// http://www.last.fm/music/Brian+Sykes/_/Deep+Cycle+Meltdown
-(void) playSkeletonMusic{

    if([elephantPlayer isPlaying]){
        [elephantPlayer pause];
    }
    
    [skeletonPlayer play];
    
}

-(void) playElephantSound{

    if([skeletonPlayer isPlaying]){
        [skeletonPlayer pause];
    }
    
    [elephantPlayer play];
}

@end
