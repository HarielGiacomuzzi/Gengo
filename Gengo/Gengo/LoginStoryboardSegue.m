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
    UIImageView *rightDoorSource = [[UIImageView alloc] initWithFrame:rightRectOpen];
    UIImageView *leftDoorSource = [[UIImageView alloc] initWithFrame:leftRectOpen];
    [rightDoorSource setImage:[UIImage imageNamed:@"curtain dir"]];
    [leftDoorSource setImage:[UIImage imageNamed:@"curtain esq"]];
    UIImageView *rightDoorDest = [[UIImageView alloc] initWithFrame:rightRectClosed];
    UIImageView *leftDoorDest = [[UIImageView alloc] initWithFrame:leftRectClosed];
    [rightDoorDest setImage:[UIImage imageNamed:@"curtain dir"]];
    [leftDoorDest setImage:[UIImage imageNamed:@"curtain esq"]];
    
    //adds images to views

    [source.view addSubview:rightDoorSource];
    [source.view addSubview:leftDoorSource];
    
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        rightDoorSource.frame = rightRectClosed;
        leftDoorSource.frame = leftRectClosed;
    } completion:^(BOOL finished) {
        [source.view addSubview:destination.view];
        [rightDoorSource removeFromSuperview];
        [leftDoorSource removeFromSuperview];
        [source.view addSubview:rightDoorSource];
        [source.view addSubview:leftDoorSource];
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            rightDoorSource.frame = rightRectOpen;
            leftDoorSource.frame = leftRectOpen;
        } completion:^(BOOL finished) {
            [source presentViewController:destination animated:NO completion:nil];
        }];
        
    }];
}

@end
