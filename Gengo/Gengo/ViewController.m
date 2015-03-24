//
//  ViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    loginView.center = self.view.center;
    loginView.delegate = self;
    [self.view addSubview:loginView];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user{
    if (FBSession.activeSession.state == FBSessionStateOpen) {
        PFQuery *query = [PFQuery queryWithClassName:@"User"];
        [query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *gameScore, NSError *error) {
            // Do something with the returned PFObject in the gameScore variable.
            NSLog(@"%@", gameScore);
        }];
        
        NSLog(@"User Name: %@",[user name]);
        NSLog(@"Birthday: %@",[user birthday]);
        NSLog(@"E-mail: %@",[user objectForKey:@"email"]);
        NSLog(@"Gender: %@",[user objectForKey:@"gender"]);
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
