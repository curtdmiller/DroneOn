//
//  FirstViewController.h
//  DroneOn
//
//  Created by Curt Miller on 12/9/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDPatch.h"

@class PitchNames;

@interface SineToneViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) PDPatch *patch;
@property (strong, nonatomic) PitchNames *pitchNames;

@property (weak, nonatomic) IBOutlet UIPickerView *sineNotePicker;

@end

