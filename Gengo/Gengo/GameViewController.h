//
//  GameViewController.h
//  NekoSenseiGame
//

//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "Lesson.h"
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController

@property (nonatomic, weak) Lesson *lesson;
@property(nonatomic) AVAudioPlayer *audioPlayer;

- (void)createScene;

@end
