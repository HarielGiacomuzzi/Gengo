//
//  PuzzleView.h
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"


@interface PuzzleView : UIViewController  <UITableViewDataSource, UITableViewDelegate>

@property NSArray* puzzlesArray;


@property (nonatomic) User *user;
@end


