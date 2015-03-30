//
//  NSObject+Puzzle.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Puzzle : NSObject

@property NSString *image1;
@property NSString *image2;
@property NSString *image3;
@property NSString *image4;
@property NSString *history;
@property NSString *soundLocation;
@property Byte piecesUnlocked;
@property NSString* nome;

-(id) initWithpiece: (Byte) pieces
               name: (NSString *) nome
            History: (NSString*) historia img1: (NSString *) im1
               img2: (NSString *) im2
               img3: (NSString*) im3
            andImg4: (NSString *) im4;

@end
