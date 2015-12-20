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
- (void)setSinePitch:(int)pitch {
    float p = (int)pitch;
    [PdBase sendFloat:p toReceiver:@"sinePitch"];
}
- (void)setSineOctaveOffset:(float)octave{
    float o = (float)octave;
    [PdBase sendFloat:o toReceiver:@"sineOctaveOffset"];
}
- (void)setSineTuning:(float)tuning{
    float t = (float)tuning;
    [PdBase sendFloat:t toReceiver:@"sineTuning"];
}
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
- (void)setFMPitch:(int)pitch{
    float p = (int)pitch;
    [PdBase sendFloat:p toReceiver:@"FMPitch"];
}
- (void)setFMTuning:(float)tuning{
    float t = (float)tuning;
    [PdBase sendFloat:t toReceiver:@"FMTuning"];

}
- (void)setFMOctaveOffset:(float)octave{
    float o = (float)octave;
    [PdBase sendFloat:o toReceiver:@"FMOctaveOffset"];
}


#pragma mark - record methods
- (void)record:(BOOL)startBang{
    float r = (BOOL)startBang;
    [PdBase sendBangToReceiver:@"recStart"];
}
- (void)loopPlayback:(BOOL)start{
    float l = (BOOL)start;
    [PdBase sendFloat:l toReceiver:@"recToggle"];
}
- (void)stopPlayback:(BOOL)stopBang{
    float s = (BOOL)stopBang;
    [PdBase sendBangToReceiver:@"recStop"];
}
- (void)adjustPitch:(float)midiPitch{
    float p = (float)midiPitch;
    [PdBase sendFloat:p toReceiver:@"playbackPitch"];
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
