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

- (void)viewDidLoad {
    [super viewDidLoad];

    self.patch = [[PDPatch alloc]initWithFile:@"DroneOnSine.pd"];
    self.pitchNames = [[PitchNames alloc] init];

    self.sineNotePicker.dataSource = self;
    self.sineNotePicker.delegate = self;
    [self.sineNotePicker selectRow:2 inComponent:1 animated:NO];
    [self.sineNotePicker selectRow:0 inComponent:0 animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return ((NSArray *)_pitchNames.pitches[component]).count;
}
// set text in rows via 2d array
//- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return _pitchNames.pitches[component][row];
//}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = _pitchNames.pitches[component][row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return attString;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) { // if selection made from letter names column
        int currentPitch = [self.pitchNames pitchNameToMidi:[self.pitchNames.pitches[component] objectAtIndex:row]];
        [self.patch setSinePitch:currentPitch];
        NSLog(@"current pitch: %d", currentPitch);
    } else { // if selection made from octave column
        int currentOctave = [self.pitchNames octaveNameToInt:[self.pitchNames.pitches[component] objectAtIndex:row]];
        [self.patch setSineOctaveOffset:currentOctave];
        NSLog(@"current octave %d", currentOctave);
    }
}

#pragma mark - Interface actions methods

- (IBAction)sineToggleSwitch:(id)sender {
    [self.patch sineToggle:(self.sineToggleSwitch.isOn)];
}
- (IBAction)sineVolumeSliderChange:(id)sender {
    [self.patch sineVolume:(self.sineVolumeSlider.value)];
}
- (IBAction)sineTuningSliderInput:(id)sender {
    [self.patch setSineTuning:self.sineTuningSlider.value];
    NSString *currentTuning = [NSString stringWithFormat:@"A = %.1f Hz", self.sineTuningSlider.value];
    self.sineTuningLabel.text = currentTuning;
    self.sineTuningStepper.value = self.sineTuningSlider.value;
}
- (IBAction)sineTuningStepperInput:(id)sender {
    [self.patch setSineTuning:self.sineTuningSlider.value];
    NSString *currentTuning = [NSString stringWithFormat:@"A = %.1f Hz", self.sineTuningSlider.value];
    self.sineTuningLabel.text = currentTuning;
    self.sineTuningSlider.value = self.sineTuningStepper.value;
}


@end
