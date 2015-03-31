//
//  UserViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/29/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [User loadUser];
    NSLog(@"%@",self.user.nome);
    self.nameLabel.text = self.user.nome;
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
    if (self.user.sexo == 0) {
        self.headImage.image = [UIImage imageNamed:@"girl head"];
    }

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
    [self.tableView reloadData];
    if (self.user.items.count > 0) {
        self.bodyImage.image = [UIImage imageNamed:@"neko body"];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lessonArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"userCell"];
    cell.lessonNumberLabel.text = @"Lição 1";
    cell.gameScoreLabel.text = [NSString stringWithFormat:@"HighScore: %@", self.user.gameScore[indexPath.row] ];
    cell.testScoreLabel.text = [NSString stringWithFormat:@"Melhor Nota: %@", self.user.lessonGrade[indexPath.row]];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




@end
