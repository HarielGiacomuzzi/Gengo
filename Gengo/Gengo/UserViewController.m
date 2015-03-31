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
    NSLog(@"%@",self.user.nome);
    self.nameLabel.text = self.user.nome;
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.user.licoes.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"userCell"];
    Lesson *l = self.user.licoes[0];
    cell.lessonNumberLabel.text = @"Lição 1";
    cell.gameScoreLabel.text = [NSString stringWithFormat:@"%ld", l.highScore ];
    cell.testScoreLabel.text = [NSString stringWithFormat:@"%@", l.grade];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}



@end
