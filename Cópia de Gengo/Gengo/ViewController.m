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
        [query whereKey:@"email" equalTo:[user objectForKey:@"email"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error && objects.count >=1) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu User.", (unsigned long)objects.count);
                // Do something with the found objects
                for (PFObject *object in objects) {
                    NSLog(@"%@", [object objectForKey:@"nome"]);
                    NSLog(@"%@", [object objectForKey:@"email"]);
                }
            } else if (!error) {
                // if the user does not exists we'll create it
                User *usuario = [[User alloc] init];
                usuario.nome = [user name];
                usuario.email = [user objectForKey:@"email"];
                usuario.nivel = 0;
                usuario.xp = 0;
                
                PFObject *newUser = [PFObject objectWithClassName:@"User"];
                newUser[@"nome"] = usuario.nome;
                newUser[@"email"] = usuario.email;
                //newUser[@"nivel"] = usuario.nivel;
                [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        NSLog(@"User Saved");
                    } else {
                        // There was a problem, check error.description
                    }
                }];
                
                
            }else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
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
