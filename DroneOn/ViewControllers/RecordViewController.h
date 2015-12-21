//
//  RecordViewController.h
//  DroneOn
//
//  Created by Curt Miller on 12/15/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDPatch.h"

@interface RecordViewController : UIViewController

@property (strong, nonatomic) PDPatch *patch;
@property (strong, nonatomic) PDPatch *olaPatch;

@end
