//
//  VCLogin.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 5/14/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "VCLogin.h"

@interface VCLogin ()
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

@end

@implementation VCLogin


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    PFUser *user = [PFUser logInWithUsername:self.txt_email.text password:self.txt_password.text];
    if (user != nil) {
        [User lodUserWithObject:user[@"userReference"]];
        if ([User loadUser] != nil) {
            [self performSegueWithIdentifier:@"segueLoginTest" sender:self];
        }
    }
    
}

@end
