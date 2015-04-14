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
    self.navBarTitle.title = @"Question 1";
    self.dictionary = [[CharacterDictionary alloc] init];
    self.questions = [self.dictionary getWordsAtRandomOrder];
    self.questionLabel.text = self.questions[0];
    self.currentWord = [self.dictionary.words valueForKey:self.questionLabel.text];
    self.romanjiLabel.text = [self.dictionary.toRomanji valueForKey:self.currentWord];
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
            [self playAnimation:YES];
            self.rightAnswers = self.rightAnswers + 1;
           // [self updateNextQuestion];
            
        }
        
    } else {
        [self playAnimation:NO];
        self.wrongAnswers = self.wrongAnswers + 1;
        //[self updateNextQuestion];
        
    }
    
}

-(void)updateNextQuestion {
    self.currentQuestion = self.currentQuestion + 1;
    //if last question
    if (self.currentQuestion == self.questions.count) {
        [self endTest];
        
    } else {
        self.questionLabel.text = self.questions[self.currentQuestion];
        self.currentWord = [self.dictionary.words valueForKey:self.questionLabel.text];
        self.romanjiLabel.text = [self.dictionary.toRomanji valueForKey:self.currentWord];
        self.navBarTitle.title = [NSString stringWithFormat:@"Question: %ld", (long)self.currentQuestion + 1];
        self.currentLetterIndex = 0;
        NSLog(@"palavra completa %@", self.currentWord);
        
    }
}

-(void)playAnimation:(BOOL)correct {
    UIColor *color;
    if (correct) {
        color = [UIColor greenColor];
    } else {
        color = [UIColor redColor];
    }

    UIColor *backgroundDefault = [UIColor whiteColor];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.backgroundView setBackgroundColor:color];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                              [self.backgroundView setBackgroundColor:backgroundDefault];
                                              
                                          }
                                          completion:^(BOOL finished){
                                              self.currentAnswerLabel.text = @"";
                                              [self updateNextQuestion];
                                          }];
                     }];
    
}

-(void)endTest {
    if([NSNumber numberWithInteger:self.rightAnswers] > self.lesson.grade) {
        self.lesson.grade = [NSNumber numberWithInteger:self.rightAnswers];
        if (self.lesson.grade > [NSNumber numberWithInt:8]) {
            [self passedTest];
            
        }
    }
    NSString *message = [NSString stringWithFormat:@"Você acertou %ld palavras", self.rightAnswers];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fim do Teste" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)closeTestButtonPressed:(UIBarButtonItem *)sender {
    [self endTest];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)passedTest {
    User *user = [User loadUser];
    Lesson *lastLesson = [user.lessonArray lastObject];
    if ([lastLesson isEqual:self.lesson]) {
        Lesson *l = [[Lesson alloc] initWithNumber:lastLesson.lessonNumber + 1];
        [user.lessonArray addObject:l];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Parabéns" message:@"Você passou de nível." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


@end
