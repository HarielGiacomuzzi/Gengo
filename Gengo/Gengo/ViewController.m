//
//  ViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *imgButton;
@property (weak, nonatomic) IBOutlet UIImageView *imgPortaDireita;
@property (weak, nonatomic) IBOutlet UIImageView *imgPortaEsquerda;

@property BOOL isLogged;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isLogged = NO;
    //[_imgButton setBackgroundImage:[UIImage imageNamed:@"facebookbutton"] forState:UIControlStateNormal];
    
    _imgPortaDireita.image = [[UIImage alloc] initWithContentsOfFile:@"porta dir"];
    _imgPortaEsquerda.image = [[UIImage alloc] initWithContentsOfFile:@"porta esqu"];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    CGPoint p = self.view.center;
    p.y = p.y - p.y/2;
    loginView.center = p;
    loginView.delegate = self;
    [self.view addSubview:loginView];
}

- (IBAction)logginButton:(id)sender {
    FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    loginView.delegate = self;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user{
    
    if (FBSession.activeSession.state == FBSessionStateOpen && self.isLogged == NO) {
        [User lodUserWithEmail:[user objectForKey:@"email"] andUser:user];
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        self.isLogged = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fbLogin:(id)sender {
    
    
}

//coloca a mesma lesson pras duas view controllers
//falta colocar os dados do user nela, precisa do sync user funcionando pra fazer as tretas
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITabBarController *tabBar = segue.destinationViewController;
    NSMutableArray *lessonArray = [[NSMutableArray alloc] initWithObjects:[[Lesson alloc] init], nil];
    LessonTableViewController *lessonvc = [tabBar.viewControllers objectAtIndex:0];
    lessonvc.lessonArray = lessonArray;
    UserViewController *uservc = [tabBar.viewControllers objectAtIndex:1];
    uservc.lessonArray = lessonArray;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
