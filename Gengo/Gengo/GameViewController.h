//
//  GameViewController.h
//  NekoSenseiGame
//

//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "Lesson.h"

@interface GameViewController : UIViewController

@property (nonatomic, weak) Lesson *lesson;

- (void)createScene;

@end
