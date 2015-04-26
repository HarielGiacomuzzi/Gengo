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
    [source presentViewController:destination animated:NO completion:nil];

}

@end
