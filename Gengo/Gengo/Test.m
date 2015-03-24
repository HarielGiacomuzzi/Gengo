//
//  Test.m
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "Test.h"

@implementation Test

- (id)init {
    self = [super init];
    if( self ){
        _characters = @{ @"あ" : @"a",
                         @"い" : @"i",
                         @"う" : @"u",
                         @"え" : @"e",
                         @"お" : @"o",
                         };
        self.keys = [[NSMutableArray alloc] init];
        for (NSString *key in _characters) {
            [self.keys addObject:key];
            [self.keys addObject:key];
        }
        self.currentQuestion = 0;
        
    }
    return self;
}

-(NSString *)getRandomKey {
    NSArray *keys = [self.characters allKeys];
    int size = (int)keys.count;
    int i = arc4random() % size;
    return keys[i];
}

-(NSString *)getQuestion {
    self.currentQuestion = self.currentQuestion + 1;
    int size = (int)self.keys.count;
    int i = arc4random() % size;
    NSString *s = self.keys[i];
    [self.keys removeObjectAtIndex:i];
    return s;
}

-(NSArray *)getAnswsers {
    return [self.characters allValues];
}



@end
