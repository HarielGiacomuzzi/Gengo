//
//  HandOffViewController.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 5/26/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "HandOffViewController.h"

@interface HandOffViewController()
@property (weak, nonatomic) IBOutlet UILabel *lblRomaji;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UIButton *btnA;
@property (weak, nonatomic) IBOutlet UIButton *btnB;

@end

@implementation HandOffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblRomaji.text = romaji;
    self.lblQuestion.text = question;
    int i  = rand()%4;
    if (i > 5) {
        self.btnA.titleLabel.text = rightOption;
        self.btnB.titleLabel.text = wrongOption;
    }else{
        self.btnB.titleLabel.text = rightOption;
        self.btnA.titleLabel.text = wrongOption;
    }
    self.img.image = [UIImage imageNamed:imageName];
}

- (IBAction)btnClicked:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:rightOption]) {
        UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Parabéns" message:@"Você Ganhou $5" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
        User *usr = [User loadUser];
        usr.money = usr.money+5;
        [SaveUtility SyncUser];
        [self performSegueWithIdentifier:@"gotoApp" sender:nil];
    }
    UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Oops" message:@"Você Ganhou $0" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [a show];
    [self performSegueWithIdentifier:@"gotoApp" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
