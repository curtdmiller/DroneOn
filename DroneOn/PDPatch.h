//
//  PDPatch.h
//  DroneOn
//
//  Created by Curt Miller on 12/3/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PdDispatcher.h"

@interface PDPatch : NSObject

- (instancetype)initWithFile:(NSString *)pdFile;

- (void)setPitch:(int)pitch;
- (void)setTuning:(float)tuning;
- (void)setOctaveOffset:(float)octave;

// sine specific methods
- (void)setSinePitch:(int)pitch;
- (void)setSineOctaveOffset:(float)octave;
- (void)setSineTuning:(float)tuning;
- (void)sineToggle:(BOOL)yesNo;
- (void)sineVolume:(float)volume;

// noise specific methods
- (void)noiseToggle:(BOOL)yesNo;
- (void)setNoiseVolume:(float)volume;
- (void)setNoiseHighPass:(float)freq;
- (void)setNoiseLowPass:(float)freq;

// fm specific methods
- (void)fmToggle:(BOOL)yesNo;
- (void)setFMVolume:(float)volume;
- (void)setFMIndex:(float)brightness;
- (void)setFMPitch:(int)pitch;
- (void)setFMTuning:(float)tuning;
- (void)setFMOctaveOffset:(float)octave;




@end
