//
//  StoreViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/27/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "StoreViewController.h"

@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistItemPath = [[NSBundle mainBundle] pathForResource:@"Items" ofType:@"plist"];
    NSArray *itemsArray = [[NSArray alloc] initWithContentsOfFile:plistItemPath];
    self.items = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in itemsArray) {
        NSString *itemName = dic[@"name"];
        NSString *itemDesc = dic[@"desc"];
        NSString *itemImage = dic[@"image"];
        NSNumber *itemPrice = dic[@"price"];
        Item *item = [[Item alloc] initWithName:itemName desc:itemDesc image:itemImage andPrice:itemPrice];
        [self.items addObject:item];
    }

    self.user = [User loadUser];
    self.moneyLabel.text = [NSString stringWithFormat:@"Dinheiro Total: %ld N$", self.user.money];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StoreTableViewCell *cell = (StoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"storeCell"];
    Item * item = [self.items objectAtIndex:indexPath.row];
    cell.itemName.text = item.name;
    cell.descriptionTextView.text = item.desc;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ N$", item.price];
    cell.itemImage.image = [UIImage imageNamed:item.image];
    if ([self.user.items[indexPath.row] integerValue] == 1) {
        [cell.buyButton setTitle:@"Vestir" forState:UIControlStateNormal];
    }
    
    [cell.buyButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)buttonPressed:(UIButton *)sender {
    
    NSIndexPath *idxPath = [self findIndexPathCorrespondentToButton:sender];
    if ([self.user.items[idxPath.row] integerValue] == 1) {
        [self wearButtonPressed:idxPath];
    } else {
        [self buyButtonPressed:idxPath];
    }
    [SaveUtility SyncUser];
    [self.tableView reloadData];

    
}

-(NSIndexPath *)findIndexPathCorrespondentToButton:(UIButton *)button{
    UIView *superView = button.superview;
    UIView *foundSuperView = nil;
    
    while (nil != superView && nil == foundSuperView) {
        if ([superView isKindOfClass:[UITableViewCell class]]) {
            foundSuperView = superView;
        } else {
            superView = superView.superview;
        }
    }
    
    return [self.tableView indexPathForCell:(UITableViewCell *)foundSuperView];

}

-(void)buyButtonPressed:(NSIndexPath *) idxPath {
    Item *item = [self.items objectAtIndex:idxPath.row];
    
    if (self.user.money < [item.price integerValue]) {
        [self noMoneyWarning];
    } else {
        self.user.money = self.user.money - [item.price integerValue];
        [self.user.items replaceObjectAtIndex:idxPath.row withObject:@1];
    }
    
    self.moneyLabel.text = [NSString stringWithFormat:@"Dinheiro Total: %ld N$", self.user.money];
}

-(void)noMoneyWarning {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops..." message:@"Você não tem dinheiro o suficiente." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


-(void)wearButtonPressed:(NSIndexPath *) idxPath {
    self.user.itemInUse = [NSNumber numberWithInteger:idxPath.row];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
