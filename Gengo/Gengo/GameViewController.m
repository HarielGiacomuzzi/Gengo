//
//  GameViewController.m
//  NekoSenseiGame
//
//  Created by Daniel Amarante on 3/21/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

-(void)createScene {
    //load file
    GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
    scene.viewController = self;
    scene.dictionary = self.lesson.dictionary;
    
    //configure the view
    SKView * skView = (SKView *)self.view;
    //spritekit applies additional optimizations to improve rendering performance
    skView.ignoresSiblingOrder = YES;
    
    //set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    //present scene with fade
    [skView presentScene:scene transition:[SKTransition fadeWithDuration:0.5]];

}

-(void)viewWillLayoutSubviews {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createScene) name:@"loadScene" object:nil];
    [self createScene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //setup song
    
    NSError *error;
    
    NSBundle* bundle = [NSBundle mainBundle];
    
    NSURL *url = [NSURL URLWithString:[bundle pathForResource:@"gamesong" ofType:@"mp3"]];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    self.audioPlayer.numberOfLoops = 0;
    
    if (self.audioPlayer != nil)
    {
        [self.audioPlayer play];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.audioPlayer stop];
}

@end
