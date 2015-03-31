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


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[_imgButton setBackgroundImage:[UIImage imageNamed:@"facebookbutton"] forState:UIControlStateNormal];
    
    _imgPortaDireita.image = [[UIImage alloc] initWithContentsOfFile:@"porta dir"];
    _imgPortaEsquerda.image = [[UIImage alloc] initWithContentsOfFile:@"porta esqu"];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    loginView.center = self.view.center;
    loginView.delegate = self;
    [self.view addSubview:loginView];
}

- (IBAction)logginButton:(id)sender {
    FBLoginView *loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile",@"email"]];
    loginView.delegate = self;
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
- (IBAction)fbLogin:(id)sender {
    
    
}

//código temporario enquanto o parse nao ta pronto
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITabBarController *tabBar = segue.destinationViewController;
    User *user = [[User alloc] init];
    user.nome = @"Neko Sensei";
    user.money = 100;
    //user.licoes = [[NSMutableArray alloc] initWithObjects:[[Lesson alloc] init], nil];
    user.items = [[NSMutableArray alloc] init];
    UserViewController *uservc = [tabBar.viewControllers objectAtIndex:0];
    uservc.user = user;
    LessonTableViewController *lessonvc = [tabBar.viewControllers objectAtIndex:1];
    lessonvc.user = user;
    StoreViewController *storevc =  [tabBar.viewControllers objectAtIndex:2];
    storevc.user = user;
    
}

@end
