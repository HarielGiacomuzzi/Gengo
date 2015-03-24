//
//  TestViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.dictionary = [[CharacterDictionary alloc] init];
    self.questions = [self.dictionary getKeysAtRandomOrder];
    self.quetionLabel.text = self.questions[0];
    self.currentQuestion = 0;
    
    NSArray *answers = [self.dictionary getValues];
    for (int i = 0; i < 5; i++) {
        [self.answerButtons[i] setTitle:answers[i] forState:UIControlStateNormal];
    }

}

- (IBAction)buttonTapped:(UIButton *)sender {
    self.currentQuestion = self.currentQuestion + 1;
    NSString *rightAnswer = [self.dictionary.characters objectForKey:self.quetionLabel.text];
    NSString *answerClicked = sender.titleLabel.text;
    
    if ([rightAnswer isEqualToString:answerClicked]) {
        self.rightAnswers = self.rightAnswers + 1;
        self.rightLabel.text = [NSString stringWithFormat:@"certas: %ld", self.rightAnswers];
    } else {
        self.wrongAnswers = self.wrongAnswers + 1;
        self.wrongLabel.text = [NSString stringWithFormat:@"erradas: %ld", self.wrongAnswers];
    }
    
    if (self.currentQuestion >= self.questions.count) {
        self.quetionLabel.text = @"fim";
        if([NSNumber numberWithInteger:self.rightAnswers] > self.lesson.grade) {
            self.lesson.grade = [NSNumber numberWithInteger:self.rightAnswers];
        }
        [self dismissViewControllerAnimated:YES completion:nil];

    } else {
        self.quetionLabel.text = self.questions[self.currentQuestion];
    }
    self.currentQuestionLabel.text = [NSString stringWithFormat:@"Question: %ld", self.currentQuestion];
    
}




@end
