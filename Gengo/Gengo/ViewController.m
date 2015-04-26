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
        [self animateDoorsClosing];
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


-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

-(void)animateDoorsClosing {
    CGFloat viewHeight = self.view.bounds.size.height;
    CGFloat viewWidth = self.view.bounds.size.width;
    //creates rects
    CGRect leftRectClosed = CGRectMake(0, 0, viewWidth / 2, viewHeight);
    CGRect leftRectOpen = CGRectMake(- (viewWidth / 2), 0, viewWidth / 2, viewHeight);
    CGRect rightRectClosed = CGRectMake(viewWidth / 2, 0, viewWidth / 2, viewHeight);
    CGRect rightRectOpen = CGRectMake(viewWidth, 0, viewWidth / 2, viewHeight);
    
    //creates images
    UIImageView *rightDoor = [[UIImageView alloc] initWithFrame:rightRectOpen];
    UIImageView *leftDoor = [[UIImageView alloc] initWithFrame:leftRectOpen];
    [rightDoor setImage:[UIImage imageNamed:@"curtain dir"]];
    [leftDoor setImage:[UIImage imageNamed:@"curtain esq"]];
    
    //adds images to views
    [self.view addSubview:rightDoor];
    [self.view addSubview:leftDoor];

    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        rightDoor.frame = rightRectClosed;
        leftDoor.frame = leftRectClosed;
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    }];

}

@end
