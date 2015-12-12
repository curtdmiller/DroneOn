//
//  FirstViewController.m
//  DroneOn
//
//  Created by Curt Miller on 12/9/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "SineToneViewController.h"
#import "PitchNames.h"

@interface SineToneViewController ()

@property (weak, nonatomic) IBOutlet UILabel *sineTuningLabel;
@property (weak, nonatomic) IBOutlet UIStepper *sineTuningStepper;
@property (weak, nonatomic) IBOutlet UISlider *sineTuningSlider;
@property (weak, nonatomic) IBOutlet UISlider *sineVolumeSlider;
@property (weak, nonatomic) IBOutlet UISwitch *sineToggleSwitch;

@end



@implementation SineToneViewController

int tuning;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.patch = [[PDPatch alloc]initWithFile:@"DroneOn.pd"];
    self.pitchNames = [[PitchNames alloc] init];

    self.sineNotePicker.dataSource = self;
    self.sineNotePicker.delegate = self;
    
    [self.patch setPitch:36];
    [self.patch setOctaveOffset:0];
    
//    NSLog(@"%lu",(unsigned long)((NSArray *)_pitchNames.pitches[0]).count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: Picker

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return ((NSArray *)_pitchNames.pitches[component]).count;
}
// set text in rows via 2d array
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pitchNames.pitches[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) { // if selection made from letter names column
        int currentPitch = [self.pitchNames pitchNameToMidi:[self.pitchNames.pitches[component] objectAtIndex:row]];
        [self.patch setPitch:currentPitch];
        NSLog(@"current pitch: %d", currentPitch);
    } else { // if selection made from octave column
        int currentOctave = [self.pitchNames octaveNameToInt:[self.pitchNames.pitches[component] objectAtIndex:row]];
        [self.patch setOctaveOffset:currentOctave];
        NSLog(@"current octave %d", currentOctave);
    }
}

// MARK: Interface actions methods

- (IBAction)sineToggleSwitch:(id)sender {
    [self.patch sineToggle:(self.sineToggleSwitch.isOn)];
}
- (IBAction)sineVolumeSliderChange:(id)sender {
    [self.patch sineVolume:(self.sineVolumeSlider.value)];
}
- (IBAction)sineTuningSliderInput:(id)sender {
    [self.patch setTuning:self.sineTuningSlider.value];
    NSString *currentTuning = [NSString stringWithFormat:@"A = %.1f Hz", self.sineTuningSlider.value];
    self.sineTuningLabel.text = currentTuning;
    tuning = self.sineTuningSlider.value;
}
- (IBAction)sineTuningStepperInput:(id)sender {

}


@end
