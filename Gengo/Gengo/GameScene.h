//
//  GameScene.h
//  NekoSenseiGame
//

//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene <SKPhysicsContactDelegate>

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
@property (nonatomic) NSDictionary *characters;


@property(nonatomic) NSString *gameState;

@property (nonatomic) BOOL endGame;





@end
