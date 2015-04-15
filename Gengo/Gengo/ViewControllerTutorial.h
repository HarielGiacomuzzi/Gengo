//
//  ViewControllerTutorial.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/26/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialDrawView.h"
#import <AVFoundation/AVFoundation.h>
#import "ViewTutorial1.h"
#import "ViewControllerDesenhaLetra.h"
#import "xibAnimation.h"
#import "Lesson.h"

@interface ViewControllerTutorial : UIViewController <UIScrollViewDelegate>

@property (nonatomic) Lesson *lesson;

@end
