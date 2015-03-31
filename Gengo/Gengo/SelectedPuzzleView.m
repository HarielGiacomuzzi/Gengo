//
//  SelectedPuzzleView.m
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "SelectedPuzzleView.h"

@implementation SelectedPuzzleView


-(void) viewDidLoad{
    
    _puzzleName.title = _myPuzzle.nome;
    
    switch (_myPuzzle.piecesUnlocked) {
        case 0001:
            [_puzzleImage setImage:[UIImage imageNamed: _myPuzzle.image1]];
            break;
        case 0010:
            [_puzzleImage setImage:[UIImage imageNamed: _myPuzzle.image2]];
            break;
        case 0011:
            [_puzzleImage setImage:[UIImage imageNamed: _myPuzzle.image3]];
            break;
        case 0100:
            [_puzzleImage setImage:[UIImage imageNamed: _myPuzzle.image3]];
            break;
        default:
            break;
    }
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
