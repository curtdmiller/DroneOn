//
//  PDPatch.m
//  DroneOn
//
//  Created by Curt Miller on 12/3/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "PDPatch.h"

@implementation PDPatch

#pragma mark - global patch methods
- (void)setPitch:(int)pitch {
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

#pragma mark - sine specific methods
- (void)sineToggle:(BOOL)switchState {
    float yn = (BOOL)switchState;
    [PdBase sendFloat:yn toReceiver:@"oscToggle"];
}
- (void)sineVolume:(float)volume{
    float sv = (float)volume;
    [PdBase sendFloat:sv toReceiver:@"oscVol"];
}


#pragma mark - noise specific methods
- (void)noiseToggle:(BOOL)yesNo {
    float yn = (BOOL)yesNo;
    [PdBase sendFloat:yn toReceiver:@"noiseToggle"];
}
- (void)setNoiseVolume:(float)volume {
    float v = (float)volume;
    [PdBase sendFloat:v toReceiver:@"noiseVol"];
}
- (void)setNoiseHighPass:(float)freq {
    float f = (float)freq;
    [PdBase sendFloat:f toReceiver:@"noiseHipFreq"];
}
- (void)setNoiseLowPass:(float)freq {
    float f = (float)freq;
    [PdBase sendFloat:freq toReceiver:@"noiseLopFreq"];
}

#pragma mark - FM specific methods
- (void)fmToggle:(BOOL)yesNo{
    float yn = (BOOL)yesNo;
    [PdBase sendFloat:yn toReceiver:@"PMToggle"];
}
- (void)setFMVolume:(float)volume{
    float v = (float)volume;
    [PdBase sendFloat:v toReceiver:@"PMVol"];
}
- (void)setFMIndex:(float)brightness{
    float i = (float)brightness;
    [PdBase sendFloat:i toReceiver:@"index"];
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
