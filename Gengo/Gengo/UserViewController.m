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
    self.nameLabel.text = self.user.nome;
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
    if (self.user.sexo == 0) {
        self.headImage.image = [UIImage imageNamed:@"girl head"];
    }

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.user.items);
    NSLog(@"%@",self.user.itemInUse);
    self.moneyLabel.text = [NSString stringWithFormat:@"%ld N$", self.user.money];
    
    NSString *plistItemPath = [[NSBundle mainBundle] pathForResource:@"Items" ofType:@"plist"];
    NSArray *itemsArray = [[NSArray alloc] initWithContentsOfFile:plistItemPath];
    NSDictionary *dic = itemsArray[[self.user.itemInUse integerValue]];
    self.bodyImage.image = [UIImage imageNamed:dic[@"image"]];
    
    if ([self.user.itemInUse integerValue] == 0) {
        self.bodyImage.image = [UIImage imageNamed:@"body"];
    }
    if ([self.user.itemInUse integerValue] == 1) {
        self.bodyImage.image = [UIImage imageNamed:@"neko body"];
    }
    [self.tableView reloadData];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.user.lessonArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"userCell"];
    Lesson *lesson = self.user.lessonArray[indexPath.row];
    cell.lessonNumberLabel.text = [NSString stringWithFormat:@"Lição %ld",lesson.lessonNumber];
    cell.gameScoreLabel.text = [NSString stringWithFormat:@"HighScore: %@", lesson.highScore];
    cell.testScoreLabel.text = [NSString stringWithFormat:@"Melhor Nota: %@", lesson.grade];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




@end
