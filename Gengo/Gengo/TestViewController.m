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
    self.currentWord = [self.dictionary.words valueForKey:self.questionLabel.text];
    self.currentQuestion = 0;
    self.currentLetterIndex = 0;
    NSLog(@"palavra completa %@", self.currentWord);
    self.currentAnswerLabel.text = @"";
    
    NSArray *answers = [self.dictionary.characters allKeys];
    for (int i = 0; i < 5; i++) {
        [self.answerButtons[i] setTitle:answers[i] forState:UIControlStateNormal];
    }

}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    //get correct key and key clicked
    NSString *rightKey = [self.dictionary.words objectForKey:self.questionLabel.text];
    NSRange range;
    range.length = 1;
    range.location = self.currentLetterIndex;
    rightKey = [rightKey substringWithRange:range];
    NSString *keyClicked = sender.titleLabel.text;
    
    if ([rightKey isEqualToString:keyClicked]) {
        self.currentLetterIndex = self.currentLetterIndex + 1;
        self.currentAnswerLabel.text = [NSString stringWithFormat:@"%@%@",self.currentAnswerLabel.text,keyClicked];

        if (self.currentLetterIndex == self.currentWord.length) {
            self.currentAnswerLabel.text = @"";
            self.rightAnswers = self.rightAnswers + 1;
            self.rightLabel.text = [NSString stringWithFormat:@"certas: %ld", (long)self.rightAnswers];
            [self updateNextQuestion];
            
        }

    } else {
        self.currentAnswerLabel.text = @"";
        self.wrongAnswers = self.wrongAnswers + 1;
        self.wrongLabel.text = [NSString stringWithFormat:@"erradas: %ld", (long)self.wrongAnswers];
        [self updateNextQuestion];
        
    }
    
}

-(void)updateNextQuestion {
    self.currentQuestion = self.currentQuestion + 1;
    //if last question
    if (self.currentQuestion == self.questions.count) {
        if([NSNumber numberWithInteger:self.rightAnswers] > self.lesson.grade) {
            self.lesson.grade = [NSNumber numberWithInteger:self.rightAnswers];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        self.questionLabel.text = self.questions[self.currentQuestion];
        self.currentWord = [self.dictionary.words valueForKey:self.questionLabel.text];
        self.currentQuestionLabel.text = [NSString stringWithFormat:@"Question: %ld", (long)self.currentQuestion];
        self.currentLetterIndex = 0;
        NSLog(@"palavra completa %@", self.currentWord);
        
    }
}


@end
