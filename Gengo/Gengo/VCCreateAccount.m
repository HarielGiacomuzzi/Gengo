//
//  VCCreateAccount.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 5/14/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "VCCreateAccount.h"

@interface VCCreateAccount ()
//@property (weak, nonatomic) IBOutlet UITextField *txt_nome;
//@property (weak, nonatomic) IBOutlet UITextField *txt_email;
//@property (weak, nonatomic) IBOutlet UITextField *txt_password;
//@property (weak, nonatomic) IBOutlet UITextField *txt_confirm_password;
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

-(BOOL)ValidateInfo{
    if (![self.txt_nome.text isEqualToString:@""] && self.txt_nome != nil && ![self.txt_nome.text isEqualToString:@" "]) {
        if ([self.txt_password.text isEqualToString:self.txt_confirm_password.text] && self.txt_password!= nil) {
            NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            bool a = [emailTest evaluateWithObject:self.txt_email.text];
            if(a){
                PFQuery *query = [PFQuery queryWithClassName:@"User"];
                [query whereKey:@"email" equalTo:self.txt_email.text];
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
                    NSArray *returnedItems = [query findObjects];
                    if (returnedItems.count == 0) {
                        PFUser *newUser = [[PFUser alloc] init];
                        newUser.username = self.txt_email.text;
                        newUser.password = self.txt_password.text;
                        newUser[@"userReference"] = [User createNewUser:self.txt_nome.text email:self.txt_email.text andGender:@"male"];
                        [newUser signUp];
                        dispatch_async(dispatch_get_main_queue(), ^(void){
                            [self dismissViewControllerAnimated:YES completion:nil];
                        });
                    }else{
                        dispatch_async(dispatch_get_main_queue(), ^(void){
                            UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Error" message:@"E-mail já cadastrado" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            [a show];
                        });
                    }
                });
                
            //return a;
            }else{
                UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Error" message:@"E-mail inválido\nPor favor insira um e-mail válido" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [a show];
                return NO;
            }
        }else{
            UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Senha inválida\nPor favor insira uma senha válida" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [a show];
            return NO;
        }
    }else{
        UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Nome inválido\nPor favor insira um nome válido" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
    }
    return NO;
}

- (IBAction)CreateAccount:(id)sender {
    
    if ([self ValidateInfo]) {
        
    }
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
