//
//  FMViewController.h
//  DroneOn
//
//  Created by Curt Miller on 12/13/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDPatch.h"

@class PitchNames;

@interface FMViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) PDPatch *patch;
@property (strong, nonatomic) PitchNames *pitchNames;

@property (weak, nonatomic) IBOutlet UIPickerView *fmNotePicker;

@end
