//
//  PitchNames.h
//  DroneOn
//
//  Created by Curt Miller on 12/10/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PitchNames : NSObject

@property (strong, nonatomic) NSArray *pitches;

typedef enum Pitches{
    Cnatural,
    Csharp,
    Dnatural,
    Eflat,
    Enatural,
    Fnatural,
    Fsharp,
    Gnatural,
    Gsharp,
    Anatural,
    Bflat,
    Bnatural
}Pitches;

-(int)pitchNameToMidi:(NSString *)selectedPitch;
-(int)octaveNameToInt:(NSString *)selectedOctave;

@end
