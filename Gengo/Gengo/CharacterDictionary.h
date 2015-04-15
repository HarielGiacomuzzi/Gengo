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
@property (nonatomic) NSDictionary *gameCharacters;
@property (nonatomic) NSArray *gameButtonLetters;
@property (nonatomic) NSDictionary *words;
@property (nonatomic) NSDictionary *toRomanji;

-(id)initWithLevel:(NSInteger)level;
-(NSArray *)getValues;
-(NSArray *)getPairOfKeys;
-(NSMutableArray *)getWordsAtRandomOrder;
-(NSMutableArray *)getAnswerOptionsForWord:(NSString *)word;

@end
