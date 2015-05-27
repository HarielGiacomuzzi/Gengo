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
@property (weak, nonatomic) IBOutlet FBLoginView *fbLoginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property BOOL isLogged;
@property NSUserActivity* act;

@end

@implementation VCLogin


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.fbLoginView initWithPermissions:@[@"public_profile",@"email"]];
    self.fbLoginView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
    _txt_email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"login" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
     _txt_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"senha" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    [self.loader startAnimating];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        PFUser *user = [PFUser logInWithUsername:self.txt_email.text password:self.txt_password.text];
        [user[@"userReference"] fetchIfNeeded];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (user != nil) {
                [User lodUserWithObject:user[@"userReference"]];
                if ([User loadUser] != nil) {
                    [self.loader stopAnimating];
                    [self restoreUserActivityState:self.act];
                    //[self performSegueWithIdentifier:@"loginSegue" sender:self];
                }
            }else{
                UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Login Inválido" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [a show];
                [self.loader stopAnimating];
            }
        });
    });
    
}

- (IBAction)logginButton:(id)sender {
    //FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    //loginView.delegate = self;
}

-(void)restoreUserActivityState:(NSUserActivity *)activity{
    if (activity != nil && !self.isLogged) {
        self.act = activity;
        return;
    }
    if (activity != nil && self.isLogged) {
        self.act = activity;
        [self performSegueWithIdentifier:@"gotoHandOff" sender:nil];
    }
    if (activity == nil && self.isLogged) {
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    }
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user{
    
    if (FBSession.activeSession.state == FBSessionStateOpen && self.isLogged == NO) {
        self.isLogged = YES;
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
            [User lodUserWithEmail:[user objectForKey:@"email"] andUser:user];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self restoreUserActivityState:self.act];
                //[self performSegueWithIdentifier:@"loginSegue" sender:nil];
            });
        });
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gotoHandOff"]) {
        HandOffViewController* handoff = (HandOffViewController*)segue.destinationViewController;
        
        
    }
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)unwindSegue
{
}


-(void)dismissKeyboard {
    [self.view endEditing:YES];
}


@end
