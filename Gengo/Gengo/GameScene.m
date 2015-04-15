//
//  GameScene.m
//  NekoSenseiGame
//
//  Created by Daniel Amarante on 3/21/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

const uint32_t NEKO_SENSEI = 0x1 << 0;
const uint32_t WALL = 0x1 << 1;

//vc lifecycle
-(void)didMoveToView:(SKView *)view {

    
    /* Setup your scene here */
    self.title.text = @"Neko Sensei saves the world";
    self.deviceSize = [[UIScreen mainScreen] bounds];
    self.width = self.deviceSize.size.width * 2;
    self.height = self.deviceSize.size.height * 2;
    
    self.points = 0;
    self.canMove = YES;
    self.gameState = @"mainScreen";
    self.colided  = NO;
    self.duration = @4;
    
    //find actors
    for (SKNode *child in self.children) {
        child.alpha = 0;
        if ([child.name isEqualToString:@"title"]) {
            self.title = (SKLabelNode *)child;
            
        } else if ([child.name isEqualToString:@"score"]) {
            self.score = (SKLabelNode *)child;
            
        } else if ([child.name isEqualToString:@"player"]) {
            self.player = (SKSpriteNode *)child;
            
        } else if ([child.name isEqualToString:@"obstacle"]) {
            self.obstacle = (SKSpriteNode *)child;
            self.yObstacle = self.obstacle.position.y;
            
        } else if ([child.name isEqualToString:@"japLeft"]) {
            self.japLeft = (SKLabelNode *)child;
            
        } else if ([child.name isEqualToString:@"japRight"]) {
            self.japRight = (SKLabelNode *)child;
            
        } else if ([child.name isEqualToString:@"aLabel"]) {
            self.aLabel = (SKLabelNode *)child;
            self.aLabel.text = self.dictionary.gameButtonLetters[0];
            
        } else if ([child.name isEqualToString:@"eLabel"]) {
            self.eLabel = (SKLabelNode *)child;
            self.eLabel.text = self.dictionary.gameButtonLetters[3];
            
        } else if ([child.name isEqualToString:@"iLabel"]) {
            self.iLabel = (SKLabelNode *)child;
            self.iLabel.text = self.dictionary.gameButtonLetters[1];
            
        } else if ([child.name isEqualToString:@"oLabel"]) {
            self.oLabel = (SKLabelNode *)child;
            self.oLabel.text = self.dictionary.gameButtonLetters[4];
            
        } else if ([child.name isEqualToString:@"uLabel"]) {
            self.uLabel = (SKLabelNode *)child;
            self.uLabel.text = self.dictionary.gameButtonLetters[2];
            
        } else if ([child.name isEqualToString:@"exitLabel"]) {
            self.exitLabel = (SKLabelNode *)child;
            
        } else if ([child.name isEqualToString:@"touch"]) {
            self.pressStart = (SKLabelNode *)child;
            
        }
    }
    
    self.laneCenter = self.player.position.x;
    self.laneLeft = self.aLabel.position.x;
    self.laneRight = self.oLabel.position.x;
    self.title.alpha = 1;
    self.pressStart.alpha = 1;
    
    NSArray *chars = [self.dictionary getPairOfKeys];
    self.japLeft.text = chars[0];
    self.japRight.text = chars[1];
    
    //physics
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;
    self.player.physicsBody.categoryBitMask = NEKO_SENSEI;
    self.player.physicsBody.collisionBitMask = NEKO_SENSEI;
    self.player.physicsBody.contactTestBitMask = WALL;
    self.player.physicsBody.usesPreciseCollisionDetection = YES;
    self.obstacle.physicsBody.categoryBitMask = WALL;
    self.obstacle.physicsBody.collisionBitMask = WALL;
}



-(void)runObstacles {
    int lane = arc4random_uniform(2);
    CGPoint point;
    point.y = self.yObstacle;
    switch (lane) {
        case 0:
            point.x = self.laneLeft;
            break;
        case 1:
            point.x = self.laneRight;
        default:
            break;
    }
    
    self.obstacle.position = point;
    SKAction *moveDown = [SKAction moveToY:-self.height / 4 duration:[self.duration doubleValue]];
    self.duration = [NSNumber numberWithDouble:[self.duration doubleValue] * 0.99];
    [self.obstacle runAction:moveDown completion:^{
        
        [self.aLabel setFontColor:[UIColor whiteColor]];
        [self.iLabel setFontColor:[UIColor whiteColor]];
        [self.eLabel setFontColor:[UIColor whiteColor]];
        [self.oLabel setFontColor:[UIColor whiteColor]];
        [self.uLabel setFontColor:[UIColor whiteColor]];
        NSArray *chars = [self.dictionary getPairOfKeys];
        self.japLeft.text = chars[0];
        self.japRight.text = chars[1];
        CGPoint playerPoint;
        playerPoint.y = self.player.position.y;
        playerPoint.x = self.laneCenter;
        self.player.position = playerPoint;
        self.points = self.points + 1;
        self.score.text = [NSString stringWithFormat:@"%ld", (long)self.points];
        self.canMove = YES;
        [self runObstacles];
    }];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPosition = [touch locationInNode:self];
    SKNode *nodeTouched = [self nodeAtPoint:touchPosition];
    CGPoint point;
    SKLabelNode *labelTouched;
    if ([nodeTouched.name isEqualToString:@"exitLabel"]) {
        if ([NSNumber numberWithInteger:self.points] > self.viewController.lesson.highScore) {
            self.viewController.lesson.highScore = [NSNumber numberWithInteger:self.points];
        }

        [self.viewController dismissViewControllerAnimated:YES completion:nil];
    }
    if (self.canMove) {
        if ([nodeTouched.name isEqualToString:@"aButton"] || [nodeTouched.name isEqualToString:@"aLabel"]) {
            labelTouched = self.aLabel;
        } else if ([nodeTouched.name isEqualToString:@"iButton"] || [nodeTouched.name isEqualToString:@"iLabel"]) {
            labelTouched = self.iLabel;
        } else if ([nodeTouched.name isEqualToString:@"uButton"] || [nodeTouched.name isEqualToString:@"uLabel"]) {
            labelTouched = self.uLabel;
        } else if ([nodeTouched.name isEqualToString:@"eButton"] || [nodeTouched.name isEqualToString:@"eLabel"]) {
            labelTouched = self.eLabel;
        } else if ([nodeTouched.name isEqualToString:@"oButton"] || [nodeTouched.name isEqualToString:@"oLabel"]) {
            labelTouched = self.oLabel;
        }
        
        [labelTouched setFontColor:[UIColor redColor]];
        
        if ([[self.dictionary.gameCharacters objectForKey:self.japLeft.text] isEqualToString: labelTouched.text]) {
            CGPoint point;
            point.x = self.laneLeft;
            point.y = self.player.position.y;
            self.player.position = point;
            self.canMove = NO;
            [labelTouched setFontColor:[UIColor greenColor]];
        } else if ([[self.dictionary.gameCharacters objectForKey:self.japRight.text] isEqualToString: labelTouched.text]) {
            point.x = self.laneRight;
            point.y = self.player.position.y;
            self.player.position = point;
            self.canMove = NO;
            [labelTouched setFontColor:[UIColor greenColor]];

        }
        
    }
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.gameState isEqualToString:@"mainScreen"]) {
        for (SKNode *child in self.children) {
            child.alpha = 1;
        }
        self.title.alpha = 0;
        self.pressStart.alpha = 0;
        self.gameState = @"playing";
        [self runObstacles];
        
    } else if ([self.gameState isEqualToString:@"endGame"]) {
        if ([NSNumber numberWithInteger:self.points] > self.viewController.lesson.highScore) {
            self.viewController.lesson.highScore = [NSNumber numberWithInteger:self.points];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadScene" object:nil];
    
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact {
    if (!self.colided) {
        self.colided = YES;
        self.gameState = @"endGame";
        for (SKNode *child in self.children) {
            child.alpha = 0;
        }
        self.title.text = [NSString stringWithFormat:@"FINAL SCORE %ld", (long)self.points];
        
        self.title.alpha = 1;
    }
    
}

-(void)update:(CFTimeInterval)currentTime {

    /* Called before each frame is rendered */
}

@end
