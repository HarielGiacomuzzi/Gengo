//
//  NSObject+SaveUtility.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "User.h"
#import "Item.h"
#import "Lesson.h"
#import "Puzzle.h"

@interface SaveUtility : NSObject

+(void)SyncUser;
+(NSMutableArray *)processUserItems;

@end
