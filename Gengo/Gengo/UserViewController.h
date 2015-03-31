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

@interface UserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) User *user;
@property (nonatomic) NSMutableArray *lessonArray;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *moneyLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
