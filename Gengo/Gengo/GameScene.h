//
//  GameScene.h
//  NekoSenseiGame
//

//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CharacterDictionary.h"
#import "GameViewController.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (nonatomic, weak) GameViewController *viewController;

//actors
@property (nonatomic) SKLabelNode *title;
@property (nonatomic) SKLabelNode *score;
@property (nonatomic) SKLabelNode *japLeft;
@property (nonatomic) SKLabelNode *japRight;
@property (nonatomic) SKSpriteNode *player;
@property (nonatomic) SKSpriteNode *obstacle;
@property (nonatomic) SKSpriteNode *leftButton;
@property (nonatomic) SKSpriteNode *rightButton;
@property (nonatomic) SKLabelNode *aLabel;
@property (nonatomic) SKLabelNode *eLabel;
@property (nonatomic) SKLabelNode *iLabel;
@property (nonatomic) SKLabelNode *oLabel;
@property (nonatomic) SKLabelNode *uLabel;
@property (nonatomic) SKLabelNode *exitLabel;
@property (nonatomic) SKLabelNode *pressStart;

//control
@property (nonatomic) CGFloat yObstacle;
@property (nonatomic) NSInteger points;
@property (nonatomic) BOOL canMove;
@property (nonatomic) BOOL colided;
@property (nonatomic) NSNumber *duration;

//screen size
@property (nonatomic) CGRect deviceSize;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat laneLeft;
@property (nonatomic) CGFloat laneCenter;
@property (nonatomic) CGFloat laneRight;

//dictionary
@property (nonatomic) CharacterDictionary *dictionary;


@property(nonatomic) NSString *gameState;

@property (nonatomic) BOOL endGame;







@end
