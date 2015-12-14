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


// global patch methods
- (void)setPitch:(int)pitch;
- (void)setTuning:(float)tuning;
- (void)setOctaveOffset:(float)octave;

// sine specific methods
- (void)sineToggle:(BOOL)yesNo;
- (void)sineVolume:(float)volume;

// noise specific methods
- (void)noiseToggle:(BOOL)yesNo;
- (void)setNoiseVolume:(float)volume;
- (void)setNoiseHighPass:(float)freq;
- (void)setNoiseLowPass:(float)freq;

@end
