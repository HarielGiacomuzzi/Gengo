//
//  SelectedPuzzleView.h
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Puzzle.h"

@interface SelectedPuzzleView : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *puzzleName;

@property (weak, nonatomic) IBOutlet UIImageView *puzzleImage;
@property Puzzle* myPuzzle;
@property (weak, nonatomic) IBOutlet UITextView *puzzleText;

@end
