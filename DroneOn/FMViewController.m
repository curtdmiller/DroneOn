//
//  FMViewController.m
//  DroneOn
//
//  Created by Curt Miller on 12/13/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "FMViewController.h"
#import "PitchNames.h"

@interface FMViewController ()


@property (weak, nonatomic) IBOutlet UIStepper *fmTuningStepper;
@property (weak, nonatomic) IBOutlet UISlider *fmTuningSlider;
@property (weak, nonatomic) IBOutlet UILabel *fmTuningLabel;

@property (weak, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (weak, nonatomic) IBOutlet UISlider *fmVolumeSlider;

@property (weak, nonatomic) IBOutlet UISwitch *fmToggle;

@end

@implementation FMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.patch = [[PDPatch alloc] initWithFile:@"DroneOn.pd"];
    self.pitchNames = [[PitchNames alloc] init];
    
    self.fmNotePicker.dataSource = self;
    self.fmNotePicker.delegate = self;
    
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
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = _pitchNames.pitches[component][row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return attString;
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

#pragma mark - Interface action methods

- (IBAction)brightnessSliderChange:(id)sender {
    [self.patch setFMIndex:self.brightnessSlider.value];
}
- (IBAction)fmTuningStepperChange:(id)sender {
    [self.patch setTuning:self.fmTuningSlider.value];
    NSString *currentTuning = [NSString stringWithFormat:@"A = %.1f Hz", self.fmTuningStepper.value];
    self.fmTuningLabel.text = currentTuning;
    self.fmTuningSlider.value = self.fmTuningStepper.value;
}
- (IBAction)fmTuningSliderChange:(id)sender {
    [self.patch setTuning:self.fmTuningSlider.value];
    NSString *currentTuning = [NSString stringWithFormat:@"A = %.1f Hz", self.fmTuningSlider.value];
    self.fmTuningLabel.text = currentTuning;
    self.fmTuningStepper.value = self.fmTuningSlider.value;
}
- (IBAction)fmVolumeSliderChange:(id)sender {
    [self.patch setFMVolume:self.fmVolumeSlider.value];
}
- (IBAction)fmToggleChange:(id)sender {
    [self.patch fmToggle:self.fmToggle.isOn];
}

@end
