//
//  PitchNames.m
//  DroneOn
//
//  Created by Curt Miller on 12/10/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "PitchNames.h"

@implementation PitchNames

-(int)pitchNameToMidi:(NSString *)selectedPitch{
    if ([selectedPitch isEqualToString:@"C"]) {
        return 36;
    } else if ([selectedPitch isEqualToString:@"C#/Db"]) {
        return 37;
    } else if ([selectedPitch isEqualToString:@"D"]) {
        return 38;
    } else if ([selectedPitch isEqualToString:@"D#/Eb"]) {
        return 39;
    } else if ([selectedPitch isEqualToString:@"E"]) {
        return 40;
    } else if ([selectedPitch isEqualToString:@"F"]) {
        return 41;
    } else if ([selectedPitch isEqualToString:@"F#/Gb"]) {
        return 42;
    } else if ([selectedPitch isEqualToString:@"G"]) {
        return 43;
    } else if ([selectedPitch isEqualToString:@"G#/Ab"]) {
        return 44;
    } else if ([selectedPitch isEqualToString:@"A"]) {
        return 45;
    } else if ([selectedPitch isEqualToString:@"A#/Bb"]) {
        return 46;
    } else if ([selectedPitch isEqualToString:@"B"]) {
        return 47;
    } else {
        return 0;
    }
}
-(int)octaveNameToInt:(NSString *)selectedOctave{
    if ([selectedOctave isEqualToString:@"1"]) {
        return 0;
    } else if ([selectedOctave isEqualToString:@"2"]) {
        return 12;
    } else if ([selectedOctave isEqualToString:@"3"]) {
        return 24;
    } else if ([selectedOctave isEqualToString:@"4"]) {
        return 36;
    } else if ([selectedOctave isEqualToString:@"5"]) {
        return 48;
    } else {
        return -1;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pitches = @[
                     @[@"C", @"C#/Db",@"D", @"D#/Eb", @"E", @"F", @"F#/Gb",
                       @"G", @"G#/Ab", @"A", @"A#/Bb", @"B"],
                     @[@"1",@"2",@"3",@"4",@"5"]
                     ];
    }
    return self;
}

@end
