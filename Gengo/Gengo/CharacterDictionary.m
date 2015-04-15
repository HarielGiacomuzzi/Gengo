//
//  CharacterDictionary.m
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "CharacterDictionary.h"

@implementation CharacterDictionary



-(id)initWithLevel:(NSInteger)level {
    self = [super init];
    if( self ){
        NSString *plistGamePath = [[NSBundle mainBundle] pathForResource:@"GameDictionary" ofType:@"plist"];
        NSArray *lessonsArray = [[NSArray alloc] initWithContentsOfFile:plistGamePath];
        NSArray *thisLesson = lessonsArray[level - 1];
        _gameCharacters = thisLesson[0];
        _characters = thisLesson[0];
        _gameButtonLetters = thisLesson[1];
        plistGamePath =[[NSBundle mainBundle] pathForResource:@"TestDictionary" ofType:@"plist"];
        lessonsArray = [[NSArray alloc] initWithContentsOfFile:plistGamePath];
        thisLesson = lessonsArray[0];
        _words = thisLesson[0];
        _toRomanji = thisLesson[1];
    }
    return self;
}

//para o teste:
//gerar o array de palavras random ate aqui
//gerar 5 letras obrigatoriamente contendo as dessa palavra

-(NSMutableArray *)getWordsAtRandomOrder {
    NSMutableArray *words = [[NSMutableArray alloc] init];
    NSMutableArray *rearrangedWords = [[NSMutableArray alloc] init];
    for (NSString *key in self.words) {
        [words addObject:key];
    }
    while (words.count > 0) {
        int size = (int)words.count;
        int i = arc4random() % size;
        [rearrangedWords addObject:words[i]];
        [words removeObjectAtIndex:i];
        
    }
    return rearrangedWords;
}

-(NSArray *)getValues {
    return [self.characters allValues];
}

-(NSMutableSet *)getCharactersFromWord:(NSString *)word {
    NSRange range;
    range.length = 1;
    range.location = 0;
    NSMutableSet *set = [[NSMutableSet alloc] init];
    for (int i = 0; i < word.length; i++) {
        [set addObject:[word substringWithRange:range]];
        range.location++;
    }
    return set;
}

-(NSString *)getRandomCharacterFromArray:(NSMutableArray *)array{
    int size = (int)array.count;
    int i = arc4random() % size;
    NSString *lucky = array[i];
    [array removeObjectAtIndex:i];
    return lucky;
}

-(NSMutableArray *)getAnswerOptionsForWord:(NSString *)word {
    NSMutableArray *options = [[NSMutableArray alloc] init];
    NSMutableSet *rightOptions = [self getCharactersFromWord:word];
    NSArray *temp = [self.characters allKeys];
    NSMutableArray* allCharacters = [temp mutableCopy];
    for (NSString *string in rightOptions) {
        [options addObject:string];
        [allCharacters removeObject:string];
    }
    
    for (int i = (int)options.count; i < 5; i++) {
        NSLog(@"%@",allCharacters);
        NSString *character = [self getRandomCharacterFromArray:allCharacters];
        [options addObject:character];
    }
    return options;
    
}


#pragma game functions

-(NSArray *)getPairOfKeys {
    NSArray *keys = [self.gameCharacters allKeys];
    int size = (int)keys.count;
    int i = arc4random() % size;
    int j = i;
    while (j == i) {
        j = arc4random() % size;
    }
    return @[keys[i], keys[j]];
}





@end
