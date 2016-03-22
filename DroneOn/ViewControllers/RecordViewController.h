//
//  RecordViewController.h
//  DroneOn
//
//  Created by Curt Miller on 12/15/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDPatch.h"
#import "PdDispatcher.h"
#import "WaveformView.h"

@interface RecordViewController : UIViewController <PdListener>
{
    PdDispatcher *dispatcher;
}

@property (strong, nonatomic) PDPatch *patch;

- (void)receiveFloat:(float)received fromSource:(NSString *)source;

@end
