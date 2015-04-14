//
//  TestViewController.h
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterDictionary.h"
#import "Lesson.h"
#import "User.h"

@interface TestViewController : UIViewController
@property (nonatomic) CharacterDictionary *dictionary;
@property (nonatomic) NSMutableArray *questions;

@property (nonatomic, weak) Lesson *lesson;
@property (nonatomic) NSInteger rightAnswers;
@property (nonatomic) NSInteger wrongAnswers;
@property (nonatomic) NSInteger currentQuestion;
@property (nonatomic) NSString *currentWord;
@property (nonatomic) NSInteger currentLetterIndex;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;
@property (strong, nonatomic) IBOutlet UILabel *currentAnswerLabel;
@property (strong, nonatomic) IBOutlet UILabel *romanjiLabel;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBarTitle;

@property (strong, nonatomic) IBOutlet UIView *backgroundView;


@end