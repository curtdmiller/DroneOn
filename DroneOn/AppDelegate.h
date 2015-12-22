//
//  AppDelegate.h
//  DroneOn
//
//  Created by Curt Miller on 12/9/15.
//  Copyright © 2015 Curt Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdAudioController.h"
#import "PdDispatcher.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PdAudioController *pd;

@end

