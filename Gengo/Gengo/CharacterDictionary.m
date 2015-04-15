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

-(NSMutableArray *)getCharactersFromWord:(NSString *)word {
    NSRange range;
    range.length = 1;
    range.location = 0;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < word.length; i++) {
        [array addObject:[word substringWithRange:range]];
        range.location++;
    }
    return array;
}

-(NSString *)getRandomCharacter{
    NSArray *keys = [self.characters allKeys];
    int size = (int)keys.count;
    int i = arc4random() % size;
    return keys[i];
}

-(NSMutableArray *)getAnswerOptionsForWord:(NSString *)word {
    NSMutableArray *options = [[NSMutableArray alloc] init];
    NSMutableArray *rightOptions = [self getCharactersFromWord:word];
    [options addObjectsFromArray:rightOptions];
    for (int i = (int)options.count; i <= 5; i++) {
        NSString *character = [self getRandomCharacter];
//        while ([options containsObject:character]) {
//            NSLog(@"%@",character);
//            character = [self getRandomCharacter];
//        }
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
