//
//  UserTableViewCell.h
//  Gengo
//
//  Created by Daniel Amarante on 3/30/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lessonNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *gameScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *testScoreLabel;

@end
