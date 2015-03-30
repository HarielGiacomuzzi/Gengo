//
//  PuzzleCell.h
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"

@interface PuzzleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property Puzzle* myPuzzle;
@end
