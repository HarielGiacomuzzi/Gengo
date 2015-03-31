//
//  PuzzleView.m
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "PuzzleView.h"
#import "PuzzleCell.h"
#import "Puzzle.h"
#import "User.h"    
#import "SelectedPuzzleView.h"

@interface PuzzleView ()


@end

@implementation PuzzleView


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    Puzzle *item1 = [[Puzzle alloc] initWithpiece:0100 name:@"Musashi" History:@"lalala" img1:@"arte 1" img2:@"arte 2" img3:@"arte 3" andImg4:@"arte 4"];
                     
    self.puzzlesArray = [[NSArray alloc] initWithObjects:item1, nil];
                     

}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _puzzlesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PuzzleCell *cell = (PuzzleCell *)[tableView dequeueReusableCellWithIdentifier:@"PuzzleCell"];
    Puzzle *item = [_puzzlesArray objectAtIndex: indexPath.row];
    cell.itemName.text = item.nome;
    cell.myPuzzle = item;
    
    switch (item.piecesUnlocked) {
        case 0001:
            [cell.itemImage setImage:[UIImage imageNamed: item.image1]];
            break;
        case 0010:
            [cell.itemImage setImage:[UIImage imageNamed: item.image2]];
            break;
        case 0011:
            [cell.itemImage setImage:[UIImage imageNamed: item.image3]];
            break;
        case 0100:
            [cell.itemImage setImage:[UIImage imageNamed: item.image4]];
            break;
        default:
            break;
    }
    cell.itemImage.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.itemImage.bounds].CGPath;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //Push new view to navigationController stack
    [self performSegueWithIdentifier:@"selectPuzzle" sender: indexPath];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    SelectedPuzzleView *newView = segue.destinationViewController;
    
    newView.myPuzzle = [_puzzlesArray objectAtIndex: ((NSIndexPath * )sender).row ];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
