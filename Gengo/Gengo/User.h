//
//  NSObject+User.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *nome;
@property NSInteger nivel;
@property NSInteger xp;
@property NSMutableArray *items;
@property char sexo;
@property NSMutableArray *lições;
@property NSMutableArray *puzzles;

+(id) loadUser;


@end
