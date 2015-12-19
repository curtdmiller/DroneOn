//
//  RecordViewController.m
//  DroneOn
//
//  Created by Curt Miller on 12/15/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *loopButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIProgressView *recordProgress;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordTouched:(id)sender {
}
- (IBAction)loopTouched:(id)sender {
}
- (IBAction)stopTouched:(id)sender {
}

@end
