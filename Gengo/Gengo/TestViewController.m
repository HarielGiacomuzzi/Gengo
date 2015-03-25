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
    self.questions = [self.dictionary getWordsAtRandomOrder];
    self.questionLabel.text = self.questions[0];
    self.wordLength = self.questionLabel.text.length;
    self.currentQuestion = 0;
    
    NSArray *answers = [self.dictionary.characters allKeys];
    for (int i = 0; i < 5; i++) {
        [self.answerButtons[i] setTitle:answers[i] forState:UIControlStateNormal];
    }

}

- (IBAction)buttonTapped:(UIButton *)sender {
    self.currentQuestion = self.currentQuestion + 1;
    NSString *rightKey = [self.dictionary.words objectForKey:self.questionLabel.text];
    NSRange range;
    range.length = 1;
    range.location = 0;
    rightKey = [rightKey substringWithRange:range];
    NSString *keyClicked = sender.titleLabel.text;
    NSLog(@"right key: %@",rightKey);
    NSLog(@"key clicked %@",keyClicked);
    
    if ([rightKey isEqualToString:keyClicked]) {
        self.rightAnswers = self.rightAnswers + 1;
        self.rightLabel.text = [NSString stringWithFormat:@"certas: %ld", (long)self.rightAnswers];
    } else {
        self.wrongAnswers = self.wrongAnswers + 1;
        self.wrongLabel.text = [NSString stringWithFormat:@"erradas: %ld", (long)self.wrongAnswers];
    }
    
    if (self.currentQuestion >= self.questions.count) {
        self.questionLabel.text = @"fim";
        if([NSNumber numberWithInteger:self.rightAnswers] > self.lesson.grade) {
            self.lesson.grade = [NSNumber numberWithInteger:self.rightAnswers];
        }
        [self dismissViewControllerAnimated:YES completion:nil];

    } else {
        self.questionLabel.text = self.questions[self.currentQuestion];
    }
    self.currentQuestionLabel.text = [NSString stringWithFormat:@"Question: %ld", (long)self.currentQuestion];
    
}




@end
