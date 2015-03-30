//
//  NSObject+Puzzle.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "Puzzle.h"

@implementation Puzzle





-(id) initWithpiece: (Byte) pieces
               name: (NSString *) nome
            History: (NSString*) historia
               img1: (NSString *) im1
               img2: (NSString *) im2
               img3: (NSString*) im3
            andImg4: (NSString *) im4{
    
    
    self = [super init];
    if (self){
        _nome = nome;
        _piecesUnlocked = pieces;
        _history = historia;
        _image1 = im1;
        _image2 = im2;
        _image3 = im3;
        _image4 = im4;
    }
    return self;
}


@end

