//
//  VCCreateAccount.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 5/14/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "VCCreateAccount.h"

@interface VCCreateAccount ()
@property (weak, nonatomic) IBOutlet UITextField *txt_nome;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_confirm_password;

@end

@implementation VCCreateAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CreateAccount:(id)sender {
    PFUser *newUser = [[PFUser alloc] init];
    newUser.username = self.txt_nome.text;
    newUser.password = self.txt_password.text;
    newUser[@"userReference"] = [User createNewUser:self.txt_nome.text email:self.txt_email.text andGender:@"male"];
    [newUser signUp];
    
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
