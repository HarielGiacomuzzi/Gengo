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
        [User lodUserWithEmail:[user objectForKey:@"email"] andUser:user];
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
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
