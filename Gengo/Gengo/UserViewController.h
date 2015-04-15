//
//  UserViewController.h
//  Gengo
//
//  Created by Daniel Amarante on 3/29/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserTableViewCell.h"
#import "Lesson.h"
#import "SaveUtility.h"

@interface UserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) User *user;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIImageView *bodyImage;

@end
