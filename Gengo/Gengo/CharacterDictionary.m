//
//  CharacterDictionary.m
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "CharacterDictionary.h"

@implementation CharacterDictionary

- (id)init {
    self = [super init];
    if( self ){
        _characters = @{ @"あ" : @"a",
                         @"い" : @"i",
                         @"う" : @"u",
                         @"え" : @"e",
                         @"お" : @"o",
                         };
        
        _words = @{@"azul" : @"あおい",
                   @"amor" : @"あい",
                   @"não"  : @"いいえ",
                   @"dizer" : @"いう",
                   @"mentira" : @"うそ",
                   @"tudo certo" : @"う",
                   @"bom" : @"ええ",
                   @"desenho" : @"え",
                   @"sobrinho": @"おい",
                   @"rei" : @"おう"
                   };
    }
    return self;
}

-(NSMutableArray *)getKeysAtRandomOrder {
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    NSMutableArray *rearrangedKeys = [[NSMutableArray alloc] init];
    for (NSString *key in self.characters) {
        [keys addObject:key];
    }
    while (keys.count > 0) {
        int size = (int)keys.count;
        int i = arc4random() % size;
        [rearrangedKeys addObject:keys[i]];
        [keys removeObjectAtIndex:i];

    }
    return rearrangedKeys;
}

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

-(NSArray *)getPairOfKeys {
    NSArray *keys = [self.characters allKeys];
    int size = (int)keys.count;
    int i = arc4random() % size;
    int j = i;
    while (j == i) {
        j = arc4random() % size;
    }
    return @[keys[i], keys[j]];
}

@end
