//
//  SoundPlayer.h
//  May3
//
//  Created by Georges Labreche on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface SoundPlayer : NSObject{
    AVAudioPlayer *skeletonPlayer;
    AVAudioPlayer *elephantPlayer;
}

-(void) playSkeletonMusic;
-(void) playElephantSound;

@end
