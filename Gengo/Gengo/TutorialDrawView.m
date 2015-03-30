//
//  TutorialDrawView.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/27/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "TutorialDrawView.h"

@implementation TutorialDrawView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)ButtonTouched:(id)sender {
     NSLog(@"Botão Pressionado.");
    [self.mainView performSegueWithIdentifier:@"gotoDrawView" sender:nil];
}

@end
