//
//  SelectedPuzzleView.m
//  Gengo
//
//  Created by Jonathas Hernandes on 30/03/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "SelectedPuzzleView.h"
#import <AVFoundation/AVFoundation.h>


@interface SelectedPuzzleView ()

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

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
            [_puzzleImage setImage:[UIImage imageNamed: _myPuzzle.image4]];
            break;
        default:
            break;
    }
    
    [_puzzleText setBackgroundColor:[UIColor clearColor]]; //clear background
  
    _puzzleText.text = @"Miyamoto Musashi conhecido como o mais famoso Samurai de todos os tempos, viveu no Japão em um dos mais conturbados momentos de sua história. Nasceu em uma família samurai e desde a infância se dedicou ao aprimoramento por meio da arte da espada, o Kenjutsu. Através da experiência de combate aperfeiçoou seu próprio estilo, que chamou de Niten Ichi Ryu. Em sua vida, Musashi Sensei, como é chamado pelos alunos de seu estilo, se defrontou com alguns dos mais hábeis guerreiros de sua época. No total foram mais de 60 embates. Nunca foi derrotado, duelo após duelo, oponente após oponente, foi aperfeiçoando seu estilo, famoso pelo uso de duas espadas simultaneamente. ";
}

-(void) ClickEventOnImage{
    
    NSString *audioName = [[NSString alloc] init];
    
    audioName = @"MiyamotoMusashi";

    
    NSError *error;
    
    NSBundle* bundle = [NSBundle mainBundle];
    
    NSURL *url = [NSURL URLWithString:[bundle pathForResource:audioName ofType:@"wav"]];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    self.audioPlayer.numberOfLoops = 0;
    
    if (self.audioPlayer != nil)
    {
        [self.audioPlayer play];
    }
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: YES];
    [self ClickEventOnImage];
}


- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
