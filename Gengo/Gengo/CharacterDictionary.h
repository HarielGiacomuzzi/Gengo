//
//  CharacterDictionary.h
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharacterDictionary : NSObject
@property (nonatomic) NSDictionary *characters;

-(id)init;

-(NSMutableArray *)getKeysAtRandomOrder;
-(NSArray *)getValues;
-(NSArray *)getPairOfKeys;

@end
