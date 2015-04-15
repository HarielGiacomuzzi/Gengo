//
//  StoreViewController.h
//  Gengo
//
//  Created by Daniel Amarante on 3/27/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "User.h"
#import "StoreTableViewCell.h"

@interface StoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) User *user;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
