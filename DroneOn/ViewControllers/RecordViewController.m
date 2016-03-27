//
//  RecordViewController.m
//  DroneOn
//
//  Created by Curt Miller on 12/15/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *recToggleSwitch;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIProgressView *recordProgress;
@property (weak, nonatomic) IBOutlet UISlider *recordTuning;
@property (weak, nonatomic) IBOutlet UISlider *recordVolumeSlider;

@end

@implementation RecordViewController

float rectime;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.patch = [[PDPatch alloc]initWithFile:@"DroneOnRecord.pd"];

    dispatcher = [[PdDispatcher alloc] init];
    [dispatcher addListener:self forSource:@"recTime"];
    [dispatcher addListener:self forSource:@"env"];
    [dispatcher addListener:self forSource:@"tester"];
    [PdBase setDelegate:dispatcher];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)receiveFloat:(float)received fromSource:(NSString *)source{
    if ([source isEqualToString:@"recTime"] == 1) {
        [self.recordProgress setProgress:received animated:NO];
//        if(received >= 1.0){
//            [self.recordPlayButton setTitleColor:[UIColor greenColor] forState:normal];
//        } else {
//            [self.recordPlayButton setTitleColor:[UIColor darkGrayColor] forState:normal];
//        }
    }
    else if ([source isEqualToString:@"env"]){
        NSLog(@"env: %f", received);
    }
    else if ([source isEqualToString:@"tester"] == 1) {
        NSLog(@"tester: %f", received);
    }
}

- (IBAction)recordTouched:(id)sender {
    [self.patch recordStartStop:1];
    [self.recordProgress setProgress:0 animated:NO];
}
- (IBAction)playButtonPressed:(id)sender {
    [self.patch recordPlayToggle:1];
    NSLog(@"play button pressed");
    
}
- (IBAction)recToggleSwitchTouched:(id)sender {
    if (self.recToggleSwitch.isOn) {
        [self.patch recordPlayToggle:1];
    }
    else {
        [self.patch recordPlayToggle:0];
    }
}
- (IBAction)recTuningChange:(id)sender {
    [self.patch adjustPitch:self.recordTuning.value];
}
- (IBAction)recVolumeSliderChanged:(id)sender {
    [self.patch recVolume:self.recordVolumeSlider.value];
}

@end
