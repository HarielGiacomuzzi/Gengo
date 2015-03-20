//
//  TestViewController.h
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface TestViewController : UIViewController
@property (nonatomic) Test *test;
@property (strong, nonatomic) IBOutlet UILabel *quetionLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentQuestionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;
@property (strong, nonatomic) IBOutlet UILabel *wrongLabel;

@end
