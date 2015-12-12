//
//  PDPatch.m
//  DroneOn
//
//  Created by Curt Miller on 12/3/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "PDPatch.h"

@implementation PDPatch

// MARK: global patch methods
- (void)setPitch:(int)pitch{
    float p = (int)pitch;
    [PdBase sendFloat:p toReceiver:@"pitch"];
}
- (void)setTuning:(float)tuning{
    float t = (float)tuning;
    [PdBase sendFloat:t toReceiver:@"tuning"];
}
- (void)setOctaveOffset:(float)octave{
    float o = (float)octave;
    [PdBase sendFloat:o toReceiver:@"octaveOffset"];
}

// MARK: sine specific methods
- (void)sineToggle:(BOOL)switchState{
    float yn = (BOOL)switchState;
    [PdBase sendFloat:yn toReceiver:@"oscToggle"];
}
- (void)sineVolume:(float)volume{
    float sv = (float)volume;
    [PdBase sendFloat:sv toReceiver:@"oscVol"];
}

- (instancetype)initWithFile:(NSString *)pdFile{
    void *patch;
    self = [super init];
    if(self){
        patch = [PdBase openFile:pdFile path:[[NSBundle mainBundle] resourcePath]];
        if (!patch) {
            NSLog(@"%@ failed to load.", pdFile);
        }
        else {
            NSLog(@"%@ loaded.", pdFile);
        }
    }

    return self;
}


@end
