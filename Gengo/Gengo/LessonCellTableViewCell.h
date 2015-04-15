//
//  LessonCellTableViewCell.h
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *exerciseButton;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UIButton *lessonButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
