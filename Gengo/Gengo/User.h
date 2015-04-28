//
//  NSObject+User.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Lesson.h"
#import "Item.h"
#import "Puzzle.h"
#import <FacebookSDK/FacebookSDK.h>

@interface User : NSObject

@property NSString *nome;
@property NSInteger nivel;
@property NSInteger xp;
@property NSMutableArray *items;
@property int sexo;
@property NSMutableArray *lessonArray;
@property NSMutableArray *puzzles;
@property NSString *email;
@property User *SharedUser;
@property NSInteger money;
@property NSNumber *itemInUse;

+(id) loadUser;
+(BOOL)lodUserWithEmail: (NSString*)email andUser: (id<FBGraphUser>)user;


@end
