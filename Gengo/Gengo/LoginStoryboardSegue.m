//
//  LoginStoryboardSegue.m
//  Gengo
//
//  Created by Daniel Amarante on 4/26/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "LoginStoryboardSegue.h"
#import "ViewController.h"
#import "LessonTableViewController.h"

@implementation LoginStoryboardSegue

-(void)perform {
    ViewController *source = self.sourceViewController;
    ViewController *destination = self.destinationViewController;
    CGFloat viewHeight = source.view.bounds.size.height;
    CGFloat viewWidth = source.view.bounds.size.width;
    //creates rects
    CGRect leftRectClosed = CGRectMake(0, 0, viewWidth / 2, viewHeight);
    CGRect leftRectOpen = CGRectMake(- (viewWidth / 2), 0, viewWidth / 2, viewHeight);
    CGRect rightRectClosed = CGRectMake(viewWidth / 2, 0, viewWidth / 2, viewHeight);
    CGRect rightRectOpen = CGRectMake(viewWidth, 0, viewWidth / 2, viewHeight);
    
    //creates images
    UIImageView *rightDoor = [[UIImageView alloc] initWithFrame:rightRectOpen];
    UIImageView *leftDoor = [[UIImageView alloc] initWithFrame:leftRectOpen];
    [rightDoor setImage:[UIImage imageNamed:@"curtain dir"]];
    [leftDoor setImage:[UIImage imageNamed:@"curtain esq"]];
    
    //adds images to views

    [source.view addSubview:rightDoor];
    [source.view addSubview:leftDoor];
    
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        rightDoor.frame = rightRectClosed;
        leftDoor.frame = leftRectClosed;
    } completion:^(BOOL finished) {
        [source.view addSubview:destination.view];
        [rightDoor removeFromSuperview];
        [leftDoor removeFromSuperview];
        [source.view addSubview:rightDoor];
        [source.view addSubview:leftDoor];
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            rightDoor.frame = rightRectOpen;
            leftDoor.frame = leftRectOpen;
        } completion:^(BOOL finished) {
            [rightDoor removeFromSuperview];
            [leftDoor removeFromSuperview];
            [source presentViewController:destination animated:NO completion:nil];
        }];
        
    }];
}

@end
