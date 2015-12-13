//
//  SecondViewController.m
//  DroneOn
//
//  Created by Curt Miller on 12/9/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "NoiseViewController.h"

@interface NoiseViewController ()

@property (weak, nonatomic) IBOutlet UISlider *noiseHighPassSlider;
@property (weak, nonatomic) IBOutlet UISlider *noiseLowPassSlider;
@property (weak, nonatomic) IBOutlet UISwitch *noiseSwitch;
@property (weak, nonatomic) IBOutlet UISlider *noiseVolumeSlider;

@end

@implementation NoiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.patch = [[PDPatch alloc]initWithFile:@"DroneOn.pd"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)highPassChange:(id)sender {
    [self.patch setNoiseHighPass:((float)self.noiseHighPassSlider.value)];
    NSLog(@"%f",self.noiseHighPassSlider.value);
}
- (IBAction)lowPassChange:(id)sender {
    [self.patch setNoiseLowPass:((float)self.noiseLowPassSlider.value)];
}
- (IBAction)noiseSwitchStateChange:(id)sender {
    [self.patch noiseToggle:(self.noiseSwitch.isOn)];
}
- (IBAction)noiseVolumeSliderChange:(id)sender {
    [self.patch setNoiseVolume:self.noiseVolumeSlider.value];
}

@end
