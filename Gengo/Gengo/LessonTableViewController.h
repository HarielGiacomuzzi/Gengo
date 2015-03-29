//
//  LessonTableViewController.h
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LessonCellTableViewCell.h"
#import "TestViewController.h"
#import "Lesson.h"
#import "GameViewController.h"
#import "User.h"
#import "SaveUtility.h"

@interface LessonTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) User *user;
@property (nonatomic) NSMutableArray *lessonArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
