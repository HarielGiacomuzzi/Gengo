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
    self.test = [[Test alloc] init];
    self.quetionLabel.text = [self.test getQuestion];
    
    NSArray *answers = [self.test getAnswsers];
    for (int i = 0; i < 5; i++) {
        [self.answerButtons[i] setTitle:answers[i] forState:UIControlStateNormal];
    }

}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    NSString *rightAnswer = [self.test.characters objectForKey:self.quetionLabel.text];
    NSString *answerClicked = sender.titleLabel.text;
    
    if ([rightAnswer isEqualToString:answerClicked]) {
        self.test.right = self.test.right + 1;
        self.rightLabel.text = [NSString stringWithFormat:@"certas: %ld", self.test.right];
    } else {
        self.test.wrong = self.test.wrong + 1;
        self.wrongLabel.text = [NSString stringWithFormat:@"erradas: %ld", self.test.wrong];
    }
    
    if (self.test.currentQuestion > 9) {
        self.quetionLabel.text = @"fim";
        //TODO
        //perform segue / pop segue / etc
    } else {
        self.quetionLabel.text = [self.test getQuestion];
    }
    self.currentQuestionLabel.text = [NSString stringWithFormat:@"Question: %ld", self.test.currentQuestion];
    
}




@end
