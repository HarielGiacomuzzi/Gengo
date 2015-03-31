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
    Item *item1 = [[Item alloc] initWithName:@"Neko Sensei Shirt" desc:@"camisa do Neko Sensei" image:@"neko body" andPrice:50];
    self.items = [[NSMutableArray alloc] initWithObjects:item1,nil];
    self.user = [User loadUser];
    self.moneyLabel.text = [NSString stringWithFormat:@"Dinheiro Total: %ld N$", self.user.money];
    NSLog(@"%@",self.user.nome);
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
    cell.priceLabel.text = [NSString stringWithFormat:@"%ld N$", item.price];
    cell.itemImage.image = [UIImage imageNamed:item.image];
    
    [cell.buyButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)buttonPressed:(UIStepper *)sender {
    
    UIView *superView = sender.superview;
    UIView *foundSuperView = nil;
    
    while (nil != superView && nil == foundSuperView) {
        if ([superView isKindOfClass:[UITableViewCell class]]) {
            foundSuperView = superView;
        } else {
            superView = superView.superview;
        }
    }
    
    NSIndexPath *idxPath = [self.tableView indexPathForCell:(UITableViewCell *)foundSuperView];
    Item *item = [self.items objectAtIndex:idxPath.row];
    NSLog(@"Item do indice: %@",item.name);
    NSLog(@"Preço do item: %ld",item.price);
    
    if (self.user.money < item.price) {
        [self noMoneyWarning];
    } else if ([self.user.items containsObject:item]) {
        [self alreadyHasItemWarning];
    } else {
        self.user.money = self.user.money - item.price;
        [self.user.items addObject:item];
    }
    
    
    NSLog(@"%ld", self.user.money);
    NSLog(@"items:");
    for (Item *i in self.user.items) {
        NSLog(@"%@",i.name);
    }
    self.moneyLabel.text = [NSString stringWithFormat:@"Dinheiro Total: %ld N$", self.user.money];
    
}

-(void)noMoneyWarning {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops..." message:@"Você não tem dinheiro o suficiente." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void)alreadyHasItemWarning {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops..." message:@"Você já tem este item." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



@end
